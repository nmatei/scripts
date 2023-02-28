# Scripts

Custom Scripts for your workstation!

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [Sleep PC after specified time](#sleep-pc-after-specified-time)
- [create-repos-list.sh - Backup your git repos structure](#create-repos-listsh---backup-your-git-repos-structure)
  - [Running:](#running)
  - [create-repos-list.sh - results](#create-repos-listsh---results)
- [create-repos-remote-url.sh - Backup your git repos remote-url](#create-repos-remote-urlsh---backup-your-git-repos-remote-url)
- [Reseting Network DNS Servers to auto](#reseting-network-dns-servers-to-auto)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## Sleep PC after specified time

Run in windows with cmd (double click on it).
Will ask to specify number of minutes to wait before PC sleep.

```sh
./sleep-pc.bat
```


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

- [x] Run [create-repos-list.sh](create-repos-list.sh) on your old device (or colleagues), using **git bash** terminal:

```sh
./create-repos-list.sh
```

- [x] Then and copy (or backup it) and run **restore-repos-list.sh** on new machine:

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


## create-repos-remote-url.sh - Backup your git repos remote-url

Usefull when migrate to a new git server and want to update all your repos remote url (git remote set-url)
The scrill will generate a list with all projects already cloned.

- change folders same as [create-repos-listsh](#create-repos-listsh---backup-your-git-repos-structure)
- find/replace server url in generated `update-repos-remote-url.sh`
- run [update-repos-remote-url.sh](update-repos-remote-url.sh) using **git bash** terminal:
```sh
./update-repos-remote-url.sh
```

check `git remote -v` inside any repos to see if they are changed

## Reseting Network DNS Servers to auto

If your network stuched with static DHCP after VPN disconnected and wish to reset it faster to 'auto'.
First time make sure to Rename Network Adapter to `Wi-Fi`, or edit `SET NAME="Wi-Fi"` in wifi-auto-dhcp.bat.

- [x] Right Click on [wifi-auto-dhcp.bat](wifi-auto-dhcp.bat) -> 🛡 Run as administrator
