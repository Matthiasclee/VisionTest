# DVC
**D**irect**V**isionTest**C**ontrol

DVC is a protocol allowing VisionTest machines to be operated remotely.

### Using DVC
To use DVC, first ensure that the target machine is running VisionTest 0.2.0-a or higher.
Then, connect to it with the following command:

```sh
ruby main.rb --dvc-client <ip address>
```

If the computer requires a password, you will be prompted with `Password: ` to enter a password.

You are now connected. You can run javascript directly on the machine, or simulate buttons on a remote from here.

#### Javascript
By default, you are in javascript mode, indicated by `[DVC-javascript]` after the prompt.
In javascript mode, you can type javasacript code to be directly executed. Example:
```
matthias-vt@192.168.0.230:[DVC-javascript]> up()
```
This will increase the size of the letters.

#### Actions
In action mode (indicated by `[DVC-action]` after the prompt), you input remote key hex codes preceeded by the remote model, and the machine runs the code for that button. Example:
```
matthias-vt@192.168.0.230:[DVC-action]> sh15A0
```
This will run the code for the `A0` button on the `sh15` remote, which shows the screensaver.

Actions run through DVC are not counted in analytics data.

#### Switching modes
You can switch modes with the `!javascript` and `!action` commands, switching to javascript or action mode.
