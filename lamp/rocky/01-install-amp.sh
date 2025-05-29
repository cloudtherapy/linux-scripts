sudo dnf upgrade -y
sudo dnf install httpd -y
sudo dnf install mariadb-server mariadb-client -y
sudo dnf install php -y
sudo systemctl enable httpd
sudo systemctl enable mariadb