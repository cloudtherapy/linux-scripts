sudo dnf upgrade -y
sudo dnf install apache2 -y
sudo dnf install mariadb-server mariadb-client -y
sudo dnf install php -y
sudo systemctl enable apache2
sudo systemctl enable mariadb