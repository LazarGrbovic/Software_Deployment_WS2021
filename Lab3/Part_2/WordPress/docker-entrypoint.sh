#!/bin/bash

sed -i "s/database_name_here/wpdb/g" /etc/wordpress/config-localhost.php
sed -i "s/username_here/lazar/g" /etc/wordpress/config-localhost.php
sed -i "s/password_here/dbpw/g" /etc/wordpress/config-localhost.php
sed -i "s/localhost/db:3306/g" /etc/wordpress/config-localhost.php

apachectl -D FOREGROUND
