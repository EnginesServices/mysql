#!/bin/sh

if test -f /home/engines/scripts/configurators/saved/db_master_pass\r\n then\r\n  cat /home/engines/scripts/configurators/saved/db_master_pass\r\nelse\r\n  echo '{\"db_master_pass\":\"Not Saved\"}'\r\nfi
