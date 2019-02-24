# encoding: UTF-8

from __future__ import print_function

import sys
import os
import json
import urllib2
import os, subprocess
import threading
import re
from gettext import gettext as _

from yum import plugins


requires_api_version = '2.3'
plugin_type = (plugins.TYPE_CORE)


def ignore_exceptions(wrapped):
    def ignoring(*args, **kwargs):
        try:
            return wrapped(*args, **kwargs)
        except Exception as exc:
            if "YUM_DEBUG" in os.environ:
                raise
    return ignoring


@ignore_exceptions
def download(catalog_url):
    """Begin download of extras catalog."""
    global downloaded_document
    req = urllib2.urlopen(catalog_url, timeout=5)
    downloaded_document = req.read()


downloaded_document = None
downloader = None

enabled_topics = None
packages_to_install = []
package_was_installed = set()
package_already_installed = set(subprocess.check_output(["rpm", "-qa", "--qf", "%{NAME} "]).split())


@ignore_exceptions
def prereposetup_hook(conduit):
    """Here at beginning of yum run, kick off thread to download extras
    catalog."""
    global downloader
    opts, args = conduit.getCmdLine()
    if args[0] == "install":

        yum_vars = dict(awsdomain="amazonaws.com", awsregion="default", releasever="2017.12")
        yum_vars.update(conduit.getConf().yumvar)

        catalog_url = os.environ.get("CATALOGURL", "http://amazonlinux.{awsregion}.{awsdomain}/{releasever}/extras-catalog.json").format(**yum_vars)
        downloader = threading.Thread(target=download, args=(catalog_url,))
        downloader.start()


@ignore_exceptions
def postverifytrans_hook(conduit):
    opts, args = conduit.getCmdLine()
    if args[0] != "install":
        return

    packages_to_install = args[1:]

    rpm_db = conduit.getRpmDB()
    for package_to_install in packages_to_install:
        if rpm_db.installed(package_to_install):
             package_was_installed.add(package_to_install)


@ignore_exceptions
def exclude_hook(conduit):
    global enabled_topics
    enabled_topics = set(r.id[11:] for r in conduit.getRepos().listEnabled() if r.id.startswith("amzn2extra-"))

    opts, args = conduit.getCmdLine()
    if args[0] != "install":
        return

    global packages_to_install
    packages_to_install = args[1:]



@ignore_exceptions
def close_hook(conduit):
    if not downloader:
        return

    downloader.join(0.5)

    if not downloaded_document:
        return

    if not packages_to_install:
        return

    catalog = json.loads(downloaded_document)

    topic_owned_package = dict()
    for topic in catalog.get("topics", []):
        if topic["n"] in enabled_topics:
            continue   # Already working. Nothing to advise.
        for p in topic.get("inst", []):
            if p not in topic_owned_package:
                topic_owned_package[p] = []
            topic_owned_package[p].append(topic["n"])

    emitted = False

    msg_fmt = _("{0} is available in Amazon Linux Extra {1} {2}\n\nTo use, run\n# sudo amazon-linux-extras install {3}")
    for package in packages_to_install:
        if package not in package_was_installed and package not in package_already_installed:
            if package in topic_owned_package:

                if not emitted:
                    print("\n")
                    emitted = True

                show_abstract = (len(topic_owned_package[package]) > 1)
                singularplural_topic = _("topic") if (len(topic_owned_package[package]) == 1) else _("topics")  # bad i18n

                if sys.stdout.isatty() and show_abstract:
                    emphasis_color = "\033[94m"
                    reset_color = "\033[0m"
                else:
                    emphasis_color = ""
                    reset_color = ""

                maybe_abstract_name = emphasis_color+":"+_("topic")+":"+reset_color if show_abstract else topic_owned_package[package][0]

                package_list_description = " and ".join('"'+emphasis_color+p+reset_color+'"' for p in topic_owned_package[package])

                print(msg_fmt.format(package, singularplural_topic, package_list_description, maybe_abstract_name))
                print("")


    if emitted:
        print(_("Learn more at"))
        print("https://aws.amazon.com/amazon-linux-2/faqs/#Amazon_Linux_Extras")
        print("\n")


# vi: set filetype=python expandtab shiftwidth=4 tabstop=4 :
