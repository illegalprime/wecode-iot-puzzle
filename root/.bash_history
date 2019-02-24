cat /etc/os-release 
sudo yum install nginx
sudo amazon-linux-extras install nginx1.12
systemctl status nginx.service 
systemctl start nginx.service 
systemctl enavke nginx.service 
systemctl enable nginx.service 
ls
rm -rf *
ls
netstat -plant 
ls
cat /etc/nginx/nginx.conf
ls /usr/share/nginx/html
curl https://www.myexternalip.com
ls
cat /etc/nginx/nginx.conf
vim /usr/share/nginx/html/index.html 
systemctl restart nginx
journalctl -fu nginx
yum install lua-nginx-module
yum install lighttpd
systemctl stop nginx.service
systemctl status ngixn
systemctl status nginx
systemctl status lighttpd
systemctl start lighttpd
systemctl enable lighttpd
systemctl status lighttpd
yum erase nginx
rm -rf /etc/nginx/ 
ls
cat /etc/lighttpd/lighttpd.conf 
less /etc/lighttpd/lighttpd.conf
ls
ls /
ls /srv/
mkdir /srv/http
echo heloo > /srv/http/index.html
ls
ls /etc/
systemctl status lighttpd
systemctl status lighttpd
systemctl restart lighttpd
systemctl status lighttpd
journalctl -fu lighttpd
netstat -plant
less /etc/lighttpd/lighttpd.conf 
ls /var/www/lighttpd/
ls /var/www/lighttpd/index.html 
cat /var/www/lighttpd/index.html
rm -rf /srv/http
journalctl -fu lighttpd
vim /etc/lighttpd/lighttpd.conf 
systemctl restart lighttpd
journalctl -fu lighttpd
vim /etc/lighttpd/lighttpd.conf 
systemctl restart lighttpd
journalctl -fu lighttpd
vim /etc/lighttpd/lighttpd.conf 
systemctl restart lighttpd
journalctl -fu lighttpd
ls
cd /var/www/lighttpd/
ls
cp index.html index.html.bak
ls
vim index.html
cd /var/www/lighttpd/
sl
ls
vim index.html
ls
ls
pwd
mkdir ../cats
ls
vim search.sh
ls
chmod +x search.sh 
ls
vim /etc/lighttpd/lighttpd.conf 
systemctl restart lighttpd
ls
readlink -f search.sh 
vim /etc/lighttpd/lighttpd.conf .
vim /etc/lighttpd/lighttpd.conf 
systemctl restart lighttpd
vim /etc/lighttpd/lighttpd.conf 
ls
mkdir cgi-bin
mv search.sh cgi-bin/
ls
systemctl restart lighttpd
ls
curl http://3.95.202.121/cgi-bin/search.sh
curl http://127.0.0.1/cgi-bin/search.sh
ls
ls ci
ls cgi-bin/
ls
chown -R lighttpd:lighttpd .
ls -al
ls cgi-bin/
ls -l cgi-bin/
systemctl restart lighttpd
vim /etc/lighttpd/lighttpd.conf 
ls -l
ls -l cgi-bin/
./cgi-bin/search.sh 
cd /etc/li
cd /etc/lighttpd/
grep -R access
journalctl -fu lighttpd
vim modules.conf 
systemctl restart lighttpd
curl http://3.95.202.121/cgi-bin/search.sh
curl http://3.95.202.121/cgi-bin/search.sh
cd /var/www/lighttpd/
ls
vim cgi-bin/search.sh 
curl http://3.95.202.121/cgi-bin/search.sh
systemctl restart lighttpd
curl http://3.95.202.121/cgi-bin/search.sh
curl http://3.95.202.121/cgi-bin/search.sh
cat cgi-bin/search.sh 
curl http://3.95.202.121/cgi-bin/search.sh
./cgi-bin/search.sh 
vim cgi-bin/search.sh 
curl http://3.95.202.121/cgi-bin/search.sh
ls
rmdir ../cats/
ls
mkdir cats
ls
cp light_logo.png cats/
readlink -f
readlink -f cats/light_logo.png 
ls
ls
ls
cd cats/
ls
rm light_logo.png 
rm light_logo.png 
ls
jq
yum install jq
curl https://api.thecatapi.com/v1/images/search 
curl https://api.thecatapi.com/v1/images/search | jq -r '.url'
curl https://api.thecatapi.com/v1/images/search | jq -r '.[] | .url'
wget $(curl https://api.thecatapi.com/v1/images/search | jq -r '.[] | .url')
ls
ls
cd ..
wget https://pkgstore.datahub.io/core/world-cities/world-cities_json/data/5b3dd46ad10990bca47b04b4739a02ba/world-cities_json.json
ls
cd cats/
jq '.[]' ../world-cities_json.json 
jq '.[] | .name' ../world-cities_json.json 
jq -r '.[] | .name' ../world-cities_json.json 
jq -r '.[] | .name' ../world-cities_json.json | shuf
jq -r '.[] | .name' ../world-cities_json.json | shuf | head -1
curl $(curl https://api.thecatapi.com/v1/images/search | jq -r '.[] | .url') > $(jq -r '.[] | .name' ../world-cities_json.json | shuf | head -1)
ls
file Maun 
mv Maun Maun.jpg
URL=$(curl https://api.thecatapi.com/v1/images/search | jq -r '.[] | .url'); echo $URL
URL=$(curl https://api.thecatapi.com/v1/images/search | jq -r '.[] | .url'); echo "${URL##*.}"
URL=$(curl https://api.thecatapi.com/v1/images/search | jq -r '.[] | .url'); curl "$URL" > $(jq -r '.[] | .name' ../world-cities_json.json | shuf | head -1)."${URL##*.}"
ls
rm 3m9.gif 
ls
while :; do URL=$(curl https://api.thecatapi.com/v1/images/search | jq -r '.[] | .url'); curl "$URL" > $(jq -r '.[] | .name' ../world-cities_json.json | shuf | head -1)."${URL##*.}"; done
ls
while :; do URL=$(curl https://api.thecatapi.com/v1/images/search | jq -r '.[] | .url'); curl "$URL" > $(jq -r '.[] | .name' ../world-cities_json.json | shuf | head -1)."${URL##*.}"; done
ls
while :; do URL=$(curl https://api.thecatapi.com/v1/images/search | jq -r '.[] | .url'); curl "$URL" > $(jq -r '.[] | .name' ../world-cities_json.json | shuf | head -1)."${URL##*.}"; done
ls
ls -1
ls -1 | grep -viE '[a-z0-9]'
ls -1 | grep -vi '[a-z0-9]'
ls -1 | grep -v '[a-z0-9]'
ls -1 | grep -Pv '[a-z0-9]'
ls -1 | grep '[a-z0-9]'
ls -1 | grep '[^a-z0-9]'
ls -1 | grep -i '[^a-z0-9]'
ls -1 | grep -i '[^a-z0-9.]'
ls -1 | grep -i '[^a-z0-9.-]'
ls -1 | grep -i '[^a-z0-9.-]'
ls
ls
ls -1 | grep -i '[^a-z0-9.-]'
ls tr -cd '\11\12\15\40-\176'
ls | tr -cd '\11\12\15\40-\176'
for i in *; do mv $i $(echo $i | tr -cd '\11\12\15\40-\176'); done
ls
for i in *; do mv $i $(echo $i | tr -cd '\11\12\15\40-\176'); done
ls
ls
jq '.[]'  ../world-cities_json.json 
jq '.[] | select(.country == "US")'  ../world-cities_json.json 
jq '.[] | select(.country == "United States")'  ../world-cities_json.json 
jq '.[] | select(.country == "United States") |.name'  ../world-cities_json.json 
jq '.[] | select(.country == "United States") | .name'  ../world-cities_json.json 
jq '.[] | select(.country == "United States") | .name'  ../world-cities_json.json | wc -l
ls
rm -rf *
ls
: jq '.[] | select(.country == "United States") | .name'  ../world-cities_json.json 
while :; do URL=$(curl https://api.thecatapi.com/v1/images/search | jq -r '.[] | .url'); curl "$URL" > $(jq -r '.[] | select(.country == "United States") | .name' ../world-cities_json.json | shuf | head -1)."${URL##*.}"; done
while :; do URL=$(curl https://api.thecatapi.com/v1/images/search | jq -r '.[] | .url'); curl "$URL" > "$(jq -r '.[] | select(.country == \"United States\") | .name' ../world-cities_json.json | shuf | head -1).${URL##*.}"; done
ls
rm -rf *
while :; do URL=$(curl https://api.thecatapi.com/v1/images/search | jq -r '.[] | .url'); curl "$URL" > $(jq -r '.[] | select(.country == "United States") | .name' ../world-cities_json.json | shuf | head -1)."${URL##*.}"; done
ls
ls -l | wc -l
while :; do URL=$(curl https://api.thecatapi.com/v1/images/search | jq -r '.[] | .url'); curl "$URL" > $(jq -r '.[] | select(.country == "United States") | .name' ../world-cities_json.json | shuf | head -1)."${URL##*.}"; done
ls
exit
exit
