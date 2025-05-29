echo "VisionTest Installer"
echo "---------------------------------"

# Check for sudo permissions
echo "Checking for sudo permissions (you may be asked for your password)"
sudo bash -c : 2>/dev/null
if [ $? == "1" ]; then
  echo "$0: Error: user does not have sudo permissions" 1>&2
  exit 1
fi

echo "Updating repos"
sudo apt-get update

echo "Removing unattended upgrades"
sudo apt purge unattended-upgrades
sudo apt purge update-notifier

echo "Installing packages"
sudo apt-get install ruby -y
sudo apt-get install ruby-dev -y
sudo apt-get install gcc -y
sudo apt-get install make -y
sudo apt-get install automake -y
sudo apt-get install git -y
sudo apt-get install firefox-geckodriver -y
sudo apt-get install unclutter -y
sudo apt-get install libgmp-dev -y
sudo apt-get install libgmp3-dev -y
sudo apt-get install libpcre3 -y
sudo apt-get install libpcre3-dev -y
sudo apt-get install ubuntu-restricted-extras -y
sudo apt-get install libavcodec58 -y

echo "Installing gems"
sudo gem install selenium-webdriver -v 4.9.0
sudo gem install ffi rbtext serialport json digest

echo "Adding user to dialout group"
sudo usermod -a -G dialout $USER

echo "Please enter the receiver tty (normally /dev/ttyUSB0): "
read receiver_tty

echo "Downloading VisionTest"
cd ~
git clone https://github.com/MatthiasCLee/VisionTest.git

echo "Creating config file"
echo "$receiver_tty" > ~/.vtreceiverport

echo "Creating launch file"
echo '#!/bin/bash' >> ~/vtlaunch
echo 'export receiver_port=$(cat ~/.vtreceiverport)' >> ~/vtlaunch
echo "unclutter -idle 0 &" >> ~/vtlaunch
echo "cd ~/VisionTest" >> ~/vtlaunch
echo "ruby main.rb --vtac-server &" >> ~/vtlaunch
echo "ruby main.rb" >> ~/vtlaunch
chmod +x ~/vtlaunch

echo "Adding entry to bashrc"
echo "# VisionTest ****" >> ~/.bashrc
echo "~/vtlaunch" >> ~/.bashrc

echo "Creating autostart entry"
mkdir ~/.config/autostart
echo "[Desktop Entry]" >> ~/.config/autostart/terinal.desktop
echo "Type=Application" >> ~/.config/autostart/terinal.desktop
echo "Exec=gnome-terminal" >> ~/.config/autostart/terinal.desktop
echo "Hidden=false" >> ~/.config/autostart/terinal.desktop
echo "NoDisplay=false" >> ~/.config/autostart/terinal.desktop
echo "X-GNOME-Autostart-enabled=true" >> ~/.config/autostart/terinal.desktop
echo "Name[en_US]=Terminal" >> ~/.config/autostart/terinal.desktop
echo "Name=Terminal" >> ~/.config/autostart/terinal.desktop
echo "Comment[en_US]=" >> ~/.config/autostart/terinal.desktop
echo "Comment=" >> ~/.config/autostart/terinal.desktop

echo "VisionTest was successfully installed. You may need to reboot to use VisionTest."
