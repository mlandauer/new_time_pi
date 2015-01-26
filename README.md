A little hardware experiment to make a physical wall clock (the kind with dials that go round) that
shows a new kind of time where the sun always rises at 6AM and sets at 6PM, wherever you are and
whatever time of year it is.

Doing this with a Raspberry Pi and a hacked wall clock mechanism.

This is very much a work in progress.

## Requirements

Ansible

## Provisioning

First (and only once) make it so you can login without a password
```
ssh-copy-id pi@10.0.0.104
```

```
cd provisioning
./provision.sh
```
