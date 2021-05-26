#!/bin/bash

pass='anything'
rds_endpoint_name='aws rds_endpoint_name'
db_name='my_db'

mysql -Nse 'show tables' $db_name -u root -p$pass -h $rds_endpoint_name \
 | while read table; do mysql -e "truncate table $table" $db_name  -u root -p$pass -h $rds_endpoint_name ; done