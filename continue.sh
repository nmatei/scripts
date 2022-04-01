echo This script will use git clone some projects.
goon=
read -p "Do you want to continue? (y/n): " goon 
if [[ $goon != 'y' ]]
then
    echo "Operation Canceled!!"
    exit
fi
echo "Start cloning Projects..."