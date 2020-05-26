#!/bin/sh

echo max_allowed_packet = 4M >> /etc/mysql/mysql.conf.d/mysqld.cnf \r\necho event-scheduler = 1 >> /etc/mysql/mysql.conf.d/mysqld.cnf \r\necho 'sql_mode=\"\"' >> /etc/mysql/mysql.conf.d/mysqld.cnf
