# Scripts
Custom Scripts for your workstation!

## create-repos-list.sh - Backup your git repos structure

Usefull when move to a new device.
The script create same folder structure with all git repos you already have on old machine.

- [x] edit [create-repos-list.sh](create-repos-list.sh) and change out=/c/Products/restore-repos-list.sh
- [x] edit [create-repos-list.sh](create-repos-list.sh) and declare -a folders that you want to backup
- [x] On old device run [create-repos-list.sh](create-repos-list.sh)
- [x] Then and copy and run **restore-repos-list.sh** on new machine

```sh
./
# or
./restore-repos-list.sh
```

