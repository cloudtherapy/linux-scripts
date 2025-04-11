sudo a2enmod ssl
sudo openssl req -x509 -nodes -days 730 -newkey rsa:2048 -keyout /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt -config ubuntu-cert.conf
sudo touch /etc/apache2/sites-available/ssl-ubuntu.conf
sudo cp ssl-ubuntu.conf /etc/apache2/sites-available/ssl-ubuntu.conf
sudo a2ensite ssl-ubuntu.conf
sudo systemctl reload apache2
