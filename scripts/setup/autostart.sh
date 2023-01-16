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

