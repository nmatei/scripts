# Scripts
Custom Scripts for your workstation!

## create-repos-list.sh - Backup your git repos structure

Usefull when move to a new device and have to clone many git projects.
The script will re create same folder structures with all git repos you already have on old machine in specified folders.

### Running:
- [x] Download/clone and edit [create-repos-list.sh](create-repos-list.sh) and update main **folders** where you have cloned your apps
    ```sh
    declare -a folders=(
        "/c/Products"
        "/c/Products/extra-packages"
    )
    ```
- [x] Run [create-repos-list.sh](create-repos-list.sh) on your old device (or colleagues):
    ```sh
    ./create-repos-list.sh
    ```
- [x] Then and copy and run **restore-repos-list.sh** on new machine:
    ```sh
    ./restore-repos-list.sh
    ```

### create-repos-list.sh - results

Content of **restore-repos-list.sh**:

```sh
mkdir /c/Products
cd /c/Products
git clone git@github.com:nmatei/node-api.git node-api
git clone git@github.com:nmatei/scripts.git scripts
# ...
```

