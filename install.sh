cd `dirname $0`
echo "Downloading https://github.com/shuzaei/csrun/archive/main.tar.gz ..."
curl -sLJO https://github.com/shuzaei/csrun/archive/main.tar.gz
echo "Extracting csrun-main.tar.gz ..."
tar -xvf csrun-main.tar.gz > /dev/null
cd csrun-main
echo "Installing csrun ..."
sudo cp csrun.sh /usr/local/bin/
sudo cp csrun /usr/local/bin/
sudo cp csdb.sh /usr/local/bin/
sudo cp csdb /usr/local/bin/
cd ..
echo "Cleaning ..."
rm csrun-main.tar.gz
rm -r csrun-main
echo -e "\e[32mInstallation Compreted\e[0m"
