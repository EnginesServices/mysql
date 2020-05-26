#!/bin/sh

. /home/engines/functions/checks.sh\r\nBTICK='`'\r\n\r\nE_BADARGS=65\r\nMYSQL=`which mysql`\r\n\r\n\r\nrequired_values=\"database_name db_username\"\r\ncheck_required_values\r\n\r\n\r\n\r\nQ1=\"DELETE FROM mysql.user where user='$db_username';\"\r\nQ2=\"FLUSH PRIVILEGES;\"\r\nQ3=\"Drop DATABASE  ${BTICK}$database_name${BTICK}   ;\"\r\nSQL=\"${Q1}${Q2}${Q3}\"

#echo \"$SQL\"

$MYSQL   -urma  -e \"$SQL\"  $database_name &> /tmp/res\r\nres=`cat /tmp/res`\r\n\r\necho $res | grep -v ERROR\r\n \r\nif test $? -eq 0\r\n then \r\n \techo \"Success\"\r\n\texit 0\r\nfi\r\n\t# dont return error but include note\r\n\techo $res | grep  \"Unknown database\"\r\nif test $? -eq 0\r\n then \r\n\techo \"Database $dbname Not Found\"\r\n\texit 0\r\nfi\r\n\t\r\necho \"Error:$res\"\r\nexit -1\r\n
