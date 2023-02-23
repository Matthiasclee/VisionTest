# VisionTest

VisionTest is a linux-based digital visual acuity chart.

### Usage
VisionTest can be used with a keyboard, but the recommended way is with a remote control. *see hardware section*

#### SC-45
See the [SC-45 layout](https://raw.githubusercontent.com/Matthiasclee/VisionTest/master/Remote%20Layouts/SC-45%20layout.pdf)

##### Buttons
* `Screensaver`: Puts the device in screensaver mode
* `+`: Makes the letters one size bigger
* `-`: Makes the letters one size smaller
* `Line`: Toggles showing only one row of letters
* `SGL`: Toggles showing only one letter per row
* `Hide`: Hides/shows the letter size in the bottom corner
* `LTR`: Shows letters
* `NUM`: Shows numbers
* `SYM`: Shows symbols
* `E`: Shows Es flipped differently
* `Rand`: Randomizes the letters on the screen
* `10`-`400`: Shortcuts to jump to letter sizes from 10/20 to 400/20

#### SH-15
See the [SH-15 layout](https://raw.githubusercontent.com/Matthiasclee/VisionTest/master/Remote%20Layouts/SH-15%20layout.pdf)
* `Hide`: Hides/shows the letter size in the bottom corner
* `Up`: Makes the letters one size bigger
* `Down`: Makes the letters one size smaller
* `Mode`: Cycles through modes (LTR/NUM/SYM/E)
* `Line`: Toggles showing only one row of letters
* `SGL`: Toggles showing only one letter per row
* `20`-`200`: Shortcuts to jump to letter sizes from 20/20 to 200/20

#### BW-7070
See the [BW-7070 layout](https://raw.githubusercontent.com/Matthiasclee/VisionTest/master/Remote%20Layouts/BW-7070%20layout.pdf)
* `SS`: Puts the device in screensaver mode
* `RAND`: Randomizes the latters on the screen
* `MODE`: Cycles through modes (LTR/NUM/SYM/E)
* `HIDE`: Hides/shows the letter size in the bottom corner
* `+`: Makes the letters one size bigger
* `-`: Makes the letters one size smaller
* `SGL`: Toggles showing only one letter per row
* `LINE`: Toggles showing only one row of letters

#### Keyboard
* `u`: One size bigger
* `d`: One size smaller
* `l`: Toggle multi-line mode
* `m`: Change mode (normal letters, numbers, symbols, rotating E)
* `s`: Toggle single mode
* `r`: Randomizes lines
* `f`: Toggle fullscreen mode
* `@`: Toggle pixel counter
* `c`: Calibration mode
* `+`: Make text larger
* `-`: Make text smaller
* `1-9`: Goes up and down to different sizes
* `!`: Toggles mirroring
* `n`: Toggles line number

### Installation

#### With script
To install VisionTest with the install script, first download the [install script](https://raw.githubusercontent.com/Matthiasclee/VisionTest/master/scripts/linux_install.sh), and put it on the target machine.
Now, ensure you have sudo access on the machine, and run it with `bash ./linux_install.sh`. The script will install dependencies, download VisionTest, and set up all config files automatically.

#### Manually
To install VisionTest manually, or from a certain version, first download the version you want from the [downloads page](https://visiontest.matthiasclee.com/downloads.html), and put it on the target machine.
Unzip it to the user's home directory. If the version is after commit `d60420e`, you can just run all of the scripts in `scripts/setup/`, and VisionTest will be automatically configured. NOTE: you will need to set the `receiver_tty` variable to the receiver tty (usually `/dev/ttyUSB0`).

### Configuration
See "Ubuntu Calibration/Setup" in the [VisionTest Install and Setup Guide](https://github.com/Matthiasclee/VisionTest/blob/master/docs/VisionTest%20install%20guide.pdf)

### Hardware
* PC: Dell Optiplex 7450 AIO
* Receiver: [Celadon RCV-3000](http://www.celadon.com/infrared-receiver-specs/RCV-3000_USB_receiver_specs.html)
* Remote: [Celadon SC-45](http://www.celadon.com/remote-control-specs/SC-45-remote-control.htm)
