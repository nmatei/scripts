#!/bin/bash
# 
# Running:
#
#   ./create-repos-list.sh
#   ./restore-repos-list.sh
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

BASEDIR="$( cd "$( dirname "$0" )" && pwd )"
echo "Script location: ${BASEDIR}"

# TODO create in current folder or get as param
out=$BASEDIR/restore-repos-list.sh

# ==========================================
# ==========================================
# ==========================================

echo create $out
touch $out

> $out

parseFolders()
{
	dir=$1
	echo "list git apps in: $dir"
	
	echo mkdir "$dir" >> $out
	echo cd $dir >> $out
	cd $dir

	for app in *; do
	  echo $app
	  echo "" >> $out
	  if [ -d "$dir/$app/" ]
	  then
		cd ./$app
		path=$(git config --get remote.origin.url)
		cd ..
		
		if [ -n "$path" ]
		then
			echo "    $path"
			echo "# $app" >> $out
			echo "git clone $path $app" >> $out
		else
			echo "# $app - not a git repo" >> $out
			echo mkdir "$app" >> $out
			# parseFolders "$dir/$app"
		fi
	  else
		echo "# $app" >> $out
		echo "$app - is file"
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
  echo "  $i) parse folder: ${folders[$i]}"
  parseFolders ${folders[$i]}
  echo ""
  echo "" >> $out
  echo "echo \"\"" >> $out
done