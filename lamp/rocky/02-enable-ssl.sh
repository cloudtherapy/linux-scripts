sudo a2enmod ssl
sudo openssl req -x509 -nodes -days 730 -newkey rsa:2048 -keyout /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt -config rocky-cert.conf
sudo cp ssl-rocky.conf /etc/apache2/sites-available/ssl-rocky.conf
sudo a2ensite ssl-rocky.conf
sudo systemctl reload httpd