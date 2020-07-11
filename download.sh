#!/bin/bash


URL=""
format=""
answer=""
filename=""

echo "What file format would you like to download?"
echo "1. MP4"
echo "2. MP3"
read format

if [ "$format" = "mp4" ] || [ "$format" = "1" ] || [ "$format" = "MP4" ]
then
        echo "You have seleted MP4"
	echo "What is the URL for the file you would like to download?"
	read URL
        echo "Would you like to rename the file? Y for yes and N for no."
        read answer
        if [ "$answer" = "n" ] || [ "$answer" = "N" ]
        then 
                youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' $URL
        else
                echo "Type a filename without an extension or quotation marks. E.G avideo."
                read filename
                youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' --output "$filename.mp4" $URL
        fi
fi


if [ "$format" = "mp3" ] || [ "$format" = "2" ] || [ "$format" = "MP3" ]
then
	echo "You have seleted MP3"
        echo "What is the URL for the file you would like to download?"
	read URL
	echo "Would you like to rename the file? Y for yes and N for no."
	read answer
	if [ "$answer" = "n" ] || [ "$answer" = "N" ]
	then 
		youtube-dl -x --audio-format mp3 $URL
	else
		echo "Type a filename without an extension or quotation marks. E.G somemusic."
		read filename
		youtube-dl -x --audio-format mp3 --output "$filename.mp3" $URL
	fi
fi

