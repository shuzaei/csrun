cd `dirname $0`
printf "Downloading https://github.com/shuzaei/csrun/archive/main.tar.gz ...\n"
curl -sLJO https://github.com/shuzaei/csrun/archive/main.tar.gz
printf "Extracting csrun-main.tar.gz ...\n"
tar -xvf csrun-main.tar.gz > /dev/null
cd csrun-main
printf "Installing csrun ...\n"
sudo cp csrun.sh /usr/local/bin/
sudo cp csrun /usr/local/bin/
sudo cp csdb.sh /usr/local/bin/
sudo cp csdb /usr/local/bin/
cd ..
printf "Cleaning ...\n"
rm csrun-main.tar.gz
rm -r csrun-main
printf "\033[32mInstallation Compreted\033[0m\n"
