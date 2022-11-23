echo "VisionTest Installer"
echo "---------------------------------"

echo "Updating repos (you may be asked for your password)"
sudo apt-get update

echo "Installing packages (you may be asked for your password)"
sudo apt-get install ruby ruby-dev gcc make automake git firefox-geckodriver unclutter libgmp-dev libgmp3-dev libpcre3 libpcre3-dev -y

echo "Installing gems (you may be asked for your password)"
sudo gem install selenium-webdriver ffi rbtext serialport

echo "Adding user to dialout group (you may be asked for your password)"
sudo usermod -a -G dialout $USER

echo "Please enter the receiver tty (normally /dev/ttyUSB0): "
read receiver_tty

echo "Downloading VisionTest"
cd ~
git clone https://github.com/MatthiasCLee/VisionTest.git

echo "Adding VisionTest startup to bashrc"
echo "# VisionTest ****" >> ~/.bashrc
echo "export receiver_port=\"$receiver_tty\"" >> ~/.bashrc
echo "unclutter -idle 0 &" >> ~/.bashrc
echo "cd ~/VisionTest" >> ~/.bashrc
echo "ruby main.rb" >> ~/.bashrc

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

echo "Install Done, change sleep settings accordingly in settings, and reboot for remote to work"
