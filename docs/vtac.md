# VTAC Usage guide
**V**ision**T**est**A**dministrative**C**onsole

VTAC is a protocol that allows for VisionTest machines to be configured and administered from a computer.

### Using VTAC
*Check out [vtacfriendly](https://github.com/Matthiasclee/VtacFriendly) for a clean, visual user interface to VTAC.*
<br>
To begin using vtac, first download VisionTest to your computer with the following command:
```sh
git clone https://github.com/Matthiasclee/VisionTest.git
```
Now, get the IP address or hostname of the VisionTest computer you want to connect to. You can find the IP addresses of all VTAC-enabled computers on a network with the following command:
```sh
nmap 192.168.0.0/24 -p 5582 --open
```
Once you have found the computer you want, change to the directory you downloaded VisionTest to, and run the following command to connect to it:
```sh
ruby main.rb --vtac-client <ip address>
```

If the computer requires a password, you will be prompted with `Password: ` to enter a password.

You are now connected to the computer with VTAC.

#### VTAC commands
* `analytics [keypresses] [clear|view <key>]` view or clear keypress analytics data.
* `config [pxsize|roomlength|mirrored <toggle>] [new setting]` change or view config settings
* `name [name]` change the `id_server` name of the computer
* `update` uses `git pull` to update the software
* `reboot` reboots the computer
* `shutdown` shuts down the computer
* `exit` ends the session
* `password [clear|set <password>]` sets or clears the VTAC password

### Setting up the VTAC server on old VisionTest models
If you newly installed VisionTest on a computer, it should come with VTAC already set up. If not, follow these steps to install VTAC:
* Run `git pull` on the VisionTest computer to get the latest VisionTest software.
* Open `~/.bashrc` in a text editor, and scroll to the bottom. Find the following lines:
```sh
# VisionTest ****
export receiver_port=\"$receiver_tty\"
unclutter -idle 0 &
cd ~/VisionTest
ruby main.rb
```
Now, add the following line in:
```sh
# VisionTest ****
export receiver_port=\"$receiver_tty\"
unclutter -idle 0 &
cd ~/VisionTest
ruby main.rb --vtac-server & # <--- This line
ruby main.rb
```
VTAC is now set up. Restart the computer to use it.
