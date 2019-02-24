#!/usr/bin/env bash

echo -ne 'HTTP/1.1 200 OK\r\n'
echo -ne 'Content-type: text/html\r\n'
echo -ne '\r\n'

cat <<-EOF
<!DOCTYPE html>
<head>
  <title>Search Results</title>
</head>
<body>
  <h1>Search Results</h1>
EOF

QUERY=$(echo "$QUERY_STRING" | cut -d= -f2 | tr '+' ' ')

echo '<br/>Your Query: <b>'"$QUERY"'</b><br/>'
echo '<ol>'

RESULTS=($(grep -i $QUERY <(ls -1 /var/www/lighttpd/cats)))

for result in ${RESULTS[@]}; do
  echo '<li><a href="/cats/'"$result"'">'"$result"'</a></li>'
done

cat <<-EOF
  </ol>
  <a href="/">Go Back</a>
</body>
EOF
