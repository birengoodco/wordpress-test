#!/bin/bash

# Create MySQL DB for WordPress
#mysql -e 'CREATE DATABASE wordpressdb;' -u root;
#mysql -e "GRANT ALL PRIVILEGES ON wordpressdb.* TO 'wordpressdb'@'localhost' IDENTIFIED BY 'passw0rd';" -u root;
#mysql -e 'FLUSH PRIVILEGES;' -u root;

# Use cURL to fetch WP-CLI
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# Make sure WP-CLI is executable
chmod +x wp-cli.phar

# Move and alias
sudo mv wp-cli.phar /usr/local/bin/wp

# Download WordPress into `wordpress` directory
sudo wp core download --locale=en_US --allow-root --path=/var/www/html/wordpress

# Generate `wp-config.php` file
sudo wp core config --allow-root --dbhost=wordpressdb-cluster.cluster-c0frm1tm3eri.eu-west-1.rds.amazonaws.com --dbname=wordpressdb --dbuser=wordpressdb --dbpass=passw0rd --path=/var/www/html/wordpress

# Install WordPress
sudo wp core install --allow-root --admin_name=wpadmin --admin_password=passw0rd --admin_email=biren@good.co --url=http://wp-test --title=WordPress --path=/var/www/html/wordpress

# Update Site URL since it was installed to a sub-directory
#sudo wp option update --allow-root siteurl http://wp-test/wordpress/ --path=/var/www/html/wordpress

# Restart the Apache server
sudo service apache2 restart
