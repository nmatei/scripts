# Scripts
Custom Scripts for your workstation!

## create-repos-list.sh - Backup your git repos structure

Usefull when move to a new device.
The script create same folder structure with all git repos you already have on old machine.

- [x] edit [create-repos-list.sh](create-repos-list.sh) and update
    ```sh
    out=/c/Products/restore-repos-list.sh

    #folders that you want to backup
    declare -a folders=(
        "/c/Products"
        #"/c/Products/extra-packages"
    )
    ```
- [x] On old device run [create-repos-list.sh](create-repos-list.sh)
- [x] Then and copy and run **restore-repos-list.sh** on new machine

```sh
./create-repos-list.sh
# or
./restore-repos-list.sh
```

