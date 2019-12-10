#!/usr/bin/with-contenv bash

echo "put your commands to deploy the file based flag here"
echo "<br>" >> /usr/html/index.html
echo "Set via FILE: " >> /usr/html/index.html
cat /goldnugget/*.gn >> /usr/html/index.html

