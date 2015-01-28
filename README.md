A little hardware experiment to make a physical wall clock (the kind with dials that go round) that
shows a new kind of time where the sun always rises at 6AM and sets at 6PM, wherever you are and
whatever time of year it is.

Doing this with a Raspberry Pi and a hacked wall clock mechanism.

This is very much a work in progress.

## Requirements

Ansible
Raspberry Pi
Wifi dongle for Raspberry Pi
8MB SD Card

## Provisioning

First (and only once) make it so you can login without a password
```
ssh-copy-id pi@10.0.0.104
```

```
cd provisioning
./provision.sh
```

## Basic Raspberry Pi setup

Follow NOOBS install instructions: http://www.raspberrypi.org/help/noobs-setup/
Plug in keyboard + wifi + monitor
Install Raspbian through NOOBS
Follow instructions on setting up wifi: https://learn.adafruit.com/adafruits-raspberry-pi-lesson-3-network-setup/setting-up-wifi-with-occidentalis
Change password
You can ssh in now and don't need to use the keyboard and screen anymore
