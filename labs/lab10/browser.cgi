#!/bin/sh


# print HTTP header
# its best to print the header ASAP because 
# debugging is hard if an error stops a valid header being printed

echo Content-type: text/html
echo

# print page content

cat <<eof
<!DOCTYPE html>
<html lang="en">
<head>
<title>Browser IP, Host and User Agent</title>
</head>
<pre>
eof

#Here are the environment variables the web server has passed to this CGI script:
#<pre>
#eof


# print all environment variables
# This is interpreted as HTML so we replace some chars by the equivalent HTML entity.
# Note this will not guarantee security in all contexts.

env|sed 's/&/\&amp;/;s/</\&lt;/g;s/>/\&gt;/g' > output.txt

cat <<eof
<body>
Your browser is running at IP address: <b>`ip=$(grep "REMOTE_ADDR" output.txt | sed 's/.*=//'); echo $ip`</b>
<p>
Your browser is running on hostname: <b>`host $(grep "REMOTE_ADDR" output.txt | sed 's/.*=//') | sed 's/.*pointer //' | sed 's/\.$//'`</b>
</p><p>
Your browser identifies as: <b>`grep "HTTP_USER_AGENT" output.txt | sed 's/.*=//'`</b>
</p>

</body>
</html>
eof
