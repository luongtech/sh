sudo apt-get install nginx
sudo service nginx start
  **** 
&error : Job for nginx.service failed because the control process exited with error code. See "systemctl status nginx.service" and "journalctl -xe" for details 
=> 
1. sudo killall apache2
2.  
*****
cd /etc/nginx
cd sites-available/
sudo cp default  default.bak
sudo cp default demo.com
sudo gedit demo.com
cd /var/www/
sudo mkdir demo.com
cd demo.com/
touch html
-> edit file root /var/www/demo.com
  -> server_name demo www.demo.com
cd ..
sudo ln -s /etc/nginx/sites-available/demo.com  /etc/nginx/sites-enabled/

sudo service nginx restart 

server {
    listen 80;

    server_name example.com;

    location / {
        proxy_pass http://localhost:3009;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}

ls | grep 'host' => lệnh tìm kiếm
