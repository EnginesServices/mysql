#!/bin/sh

#usage -y|n {section}
#defaults to -n (delete existing data)
# -y will merge

echo $0 $1 $2 >/tmp/called\r\nreplace=$1\r\nsection=$2\r\n\r\n#--replace\r\nif ! test -z $replace\r\n then\r\n  opts=--delete\r\n elif test $replace = -y\r\n  then\r\n   opts=--replace\r\n  else\r\n    opts=--delete\r\nfi\r\n\r\nif ! test -z $section\r\n then\r\n opts=\"$opts --one-database $section\"\r\n fi\r\n \r\ncat - | mysqlimport -B $opts -h 127.0.0.1 -u rma  \r\n\r\n\r\nif test $? -ne 0\r\n then \r\n   cat  /tmp/restore.run\r\n   exit 2\r\nfi\r\n\r\nmysqladmin -u rma flush-privileges\r\n \r\nexit 0
