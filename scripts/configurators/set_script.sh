#!/bin/sh

. /home/engines/functions/checks.sh\r\n required_values=\"db_master_pass\"\r\ncheck_required_values\r\n \r\nif test -n $db_master_pass\r\n then  \r\n  mysql -urma -e \\\"set password for 'root'@'%' = PASSWORD('$db_master_pass'); \\\"\t\r\n  mysql -urma -e \\\"set password for 'root'@'localhost' = PASSWORD('$db_master_pass'); \\\"\t \t\t\t\r\nfi
