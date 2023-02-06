# DVC
**D**irect**V**isionTest**C**ontrol

DVC is a protocol allowing VisionTest machines to be operated remotely.

### Using DVC
To use DVC, first ensure that the target machine is running VisionTest 0.2.0-a or higher.A
Then, connect to it with the following command:

```sh
ruby main.rb --dvc-client <ip address>
```

If the computer requires a password, you will be prompted with `Password: ` to enter a password.

You are now connected.
