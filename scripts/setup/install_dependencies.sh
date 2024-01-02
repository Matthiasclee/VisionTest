echo "Updating repos (you may be asked for your password)"
sudo apt-get update

echo "Installing packages (you may be asked for your password)"
sudo apt-get install ruby ruby-dev gcc make automake git firefox-geckodriver unclutter libgmp-dev libgmp3-dev libpcre3 libpcre3-dev -y

echo "Installing gems (you may be asked for your password)"

if [ "$1" == "--gem-no-sudo" ]; then
  gem install selenium-webdriver -v 4.9.0
  gem install ffi rbtext serialport json digest
else
  sudo gem install selenium-webdriver ffi rbtext serialport json
fi

