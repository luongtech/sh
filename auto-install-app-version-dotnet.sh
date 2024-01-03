lsb_release -a;
# ------------ Clear sạch ------------ 
echo "$(tput setaf 3)Installing .Net 6$(tput sgr0)";
sudo apt remove 'dotnet*';
sudo apt remove 'aspnetcore*';
sudo apt remove 'netstandard*';
sudo rm /etc/apt/sources.list.d/microsoft-prod.list;
sudo rm /etc/apt/sources.list.d/microsoft-prod.list.save;


wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb;
sudo dpkg -i packages-microsoft-prod.deb;
rm packages-microsoft-prod.deb;


#  ------------ dotnet 8 ------------ 
sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-8.0;

sudo apt-get update && \
  sudo apt-get install -y aspnetcore-runtime-8.0;

sudo apt-get install -y dotnet-runtime-8.0;

#  ------------ dotnet 6 ------------ 
sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-6.0;

sudo apt-get update && \
  sudo apt-get install -y aspnetcore-runtime-6.0;

sudo apt-get install -y dotnet-runtime-6.0;

# ------------ Install .net run time .net 6 ------------
wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
chmod +x ./dotnet-install.sh
sudo ./dotnet-install.sh --architecture x64 --install-dir /usr/share/dotnet/ --runtime aspnetcore --version 6.0.25
sudo ./dotnet-install.sh --architecture x64 --install-dir /usr/share/dotnet/ --runtime dotnet --version 6.0.25
rm -rf dotnet-install.sh;


#  ------------ dotnet 7 ------------
wget https://download.visualstudio.microsoft.com/download/pr/9c3e1dcb-485a-44cf-b1cb-d6c0b643d805/d4b2a46283254b6d68f61ee3f1a06952/dotnet-sdk-7.0.404-linux-x64.tar.gz
mkdir -p dotnet && tar zxf dotnet-sdk-7.0.404-linux-x64.tar.gz -C dotnet
rm -rf dotnet-sdk-7.0.404-linux-x64.tar.gz;
sudo cp -r dotnet/sdk/7.0.404 /usr/share/dotnet/sdk;
rm -rf dotnet;

wget https://download.visualstudio.microsoft.com/download/pr/7a1d3e1e-ede9-4b28-a9c8-3023858b7f01/c9214ad6a85286f4abd026d23dca5d3c/aspnetcore-runtime-7.0.14-linux-x64.tar.gz;
mkdir -p dotnet && tar zxf aspnetcore-runtime-7.0.14-linux-x64.tar.gz -C dotnet
sudo cp -r dotnet/shared/Microsoft.AspNetCore.App/7.0.14 /usr/share/dotnet/shared/Microsoft.AspNetCore.App;
sudo cp -r dotnet/shared/Microsoft.NETCore.App/7.0.14 /usr/share/dotnet/shared/Microsoft.NETCore.App;
sudo cp -r dotnet/host/fxr/7.0.14 /usr/share/dotnet/host/fxr;
rm -rf dotnet-sdk-7.0.404-linux-x64.tar.gz;
rm -rf dotnet;
