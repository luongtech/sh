

{
  echo "check node version "
  npm -v
}||{
  sudo apt update

  sudo apt install nodejs
  
  sudo apt install npm
  
}

{
    pm2 -v
}||{
    sudo npm install pm2 -g
}

{
  echo "check docker "
  docker --version
}||{
  sudo apt-get update

  sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
  
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

  echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  sudo apt-get update

  sudo apt-get install docker-ce docker-ce-cli containerd.io

  sudo apt-cache madison docker-ce
}

{
  firebase help
} || {
  sudo npm install -g firebase-tools
}

{
   ifconfig
} || {
  sudo apt install net-tools
}


{
   ibus-bamboo
} || {
  sudo add-apt-repository ppa:bamboo-engine/ibus-bamboo
  sudo apt-get update
  sudo apt-get install ibus-bamboo
  ibus restart
}
