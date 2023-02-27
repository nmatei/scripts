#!/bin/bash
# 
# Running:
#
#   ./create-repos-remote-url.sh
#   # find/replace base url (in update-repos-remote-url.sh)
#   ./update-repos-remote-url.sh
# 
# Notes:
#  - make sure you have setted git sh keys to be able to clone
#
# ==========================================

# Folders that you want to backup (no commas in array)
declare -a folders=(
	"/c/Products"
	"/c/SDL-Products"
	"/c/SDL-Products/sdl-extjs-packages"
)

# ==========================================
# Output
# ==========================================
# https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
Red='\033[0;31m'
BGreen='\033[1;32m'
BYellow='\033[1;33m'
Cyan='\033[0;36m'
NC='\033[0m' # No Color
# == == == == == == == ==

BASEDIR="$( cd "$( dirname "$0" )" && pwd )"
echo "Script location: ${BASEDIR}"

# TODO create in current folder or get as param
out=$BASEDIR/update-repos-remote-url.sh

# ==========================================
# ==========================================
# ==========================================

echo create $out
touch $out

# empty $out file
> $out

# ==========================================
# Continue Question (y/n):
# ==========================================
echo "
# ==========================================
# = = =       Ask if Continue?         = = =
# ==========================================
echo This script will update git remote url for projects.
goon=
read -p \"Do you want to continue? (y/n): \" goon 
if [[ \$goon != 'y' ]] 
then
    echo Operation Canceled!
    exit
fi
echo Start cloning your Projects...
# ==========================================
" >> $out
# ==========================================

parseFolders()
{
	dir=$1
	echo cd $dir >> $out
	cd $dir

	for app in *; do
	  echo -e "${BYellow}$app${NC}"
	  echo "" >> $out
	  if [ -d "$dir/$app/" ]
	  then
		cd ./$app
		path=$(git config --get remote.origin.url)
		cd ..
		
		if [ -n "$path" ]
		then
			echo -e "    ${Cyan}$path${NC}"
			echo "
echo -e \"${BYellow}$app${NC}\"
cd $app
git remote set-url origin \"$path\"
cd .." >> $out
		else
			echo -e "    ${Red}not a git folder!${NC}"
			echo "# $app - not a git folder" >> $out
			# parseFolders "$dir/$app"
		fi
	  else
		echo "# $app" >> $out
		echo -e "    ${Red}is a file!${NC}"
		echo "echo $app - file!" >> $out
	  fi
	  echo "echo \"\"" >> $out
	done
}

# iterate in all folders

arraylength=${#folders[@]}

for (( i=0; i<${arraylength}; i++ ));
do
  echo ""
  echo "" >> $out
  echo -e "${BGreen}$i) Parse folder: ${folders[$i]} ${NC}"
  parseFolders ${folders[$i]}
  echo ""
  echo "" >> $out
  echo "echo \"\"" >> $out
done