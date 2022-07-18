# Repositories

## Debian / Ubuntu / Mint
```yml
sudo apt install apt-transport-https curl

sudo curl -fsSLo /usr/share/keyrings/rabbitstore.pgp https://repo.rabbitstore.net/pgp-key.public

echo "deb [signed-by=/usr/share/keyrings/rabbitstore.pgp arch=amd64] https://repo.rabbitstore.net/apt stable main" | sudo tee /etc/apt/sources.list.d/rabbitstore.list
```

## Fedora / CentOS / RHEL
```yml
sudo yum-config-manager --add-repo https://repo.rabbitstore.net/rpm.repo
```