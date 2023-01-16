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

