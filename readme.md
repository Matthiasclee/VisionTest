# VisionTest

### Calibration
Open up the `js/settings.js` file, and change the value of the return in the `sizeOf10()` function until the letters in the `20/10` chart in fullscreen mode are exactly 0.5 CM tall.
Then do `v*(r/20)` where `r` is the length someone will be sitting from the monitor, and `v` is the value you have in `settings.js`, and set the value in `settings.js` to the result of that.

### Other settings

#### Default lines
In the `js/settings.js` you can change the default letters in a line. You can also change the amount of `E`s in the rotating E lines.

#### Mirroring
You can toggle mirroring on and off by pressing `!`.

###  Default key binds
* `u`: One size bigger
* `d`: One size smaller
* `l`: Toggle multi-line mode
* `m`: Change mode (normal letters, numbers, symbols, rotating E)
* `r`: Randomizes lines
* `f`: Enter fullscreen mode
* `1-9`: Goes up and down to different sizes
* `!`: Toggles mirroring
