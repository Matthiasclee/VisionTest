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
* `version [master|<version>]` Switches to a different version of VTAC *see [version switching](#version-switching)*

### Version switching
VTAC allows you to switch versions with the `version` command.

#### Updating
To update to the latest version, first run `version master`. This will put you at the latest local commit. (*this is required in order to update*) Now, run `update` to get the latest version.
You now are on the latest available git commit, which may contain incomplete features, and isn't always a full release.
To go to the latest full release, first get the version number of the latest full release from the [releases page](https://github.com/Matthiasclee/VisionTest/releases).
Now, follow the instructions for switching to a specific version, and switch to the latest release.

#### Switching to a specific version
To switch to a specific version, first ensure you have that version on the VisionTest machine. To ensure this, run the commands below to obtain the latest version.
```
version master
update
```
Now, run `version <version number>` to switch to that version. You will need to reboot the computer, or restart the VTAC server for the changes to take effect.
*Note: \<version number\> is just the number \(1.2.3\) without the "v" in front of it. If switching to a beta, include the "-beta" at the end.*


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
