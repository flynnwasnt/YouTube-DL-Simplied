#!/bin/bash


URL=""
format=""
answer=""
filename=""
searchorurlvar=""
squery=""
searchformat=""


formatprompt () {

echo "What file format would you like to download?"
echo "1. MP4"
echo "2. MP3"

}

searchorurl () {

echo "Do you have a URL for a video/audio prepared, or would you life to perform a YouTube search?"
echo "1. URL"
echo "2. Search"

}

downloadmp4URL () {

	        if [ "$answer" = "n" ] || [ "$answer" = "N" ]
	        then 
	                youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' $URL
	        else
	                echo "Type a filename without an extension or quotation marks. E.G avideo."
	                read filename
	                youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' --output "$filename.mp4" $URL
	        fi
}


downloadmp3URL () {

				if [ "$answer" = "n" ] || [ "$answer" = "N" ]
				then 
					youtube-dl -x --audio-format mp3 $URL
				else
					echo "Type a filename without an extension or quotation marks. E.G somemusic."
					read filename
					youtube-dl -x --audio-format mp3 --output "$filename.mp3" $URL
					fi

}

downloadmp4searched () {

	        if [ "$answer" = "n" ] || [ "$answer" = "N" ]
	        then 
	                youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' "ytsearch1:$squery"
	        else
	                echo "Type a filename without an extension or quotation marks. E.G avideo."
	                read filename
	                youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' --output "$filename.mp4" "ytsearch1:$squery"
	        fi
}

downloadmp3searched () {

				if [ "$answer" = "n" ] || [ "$answer" = "N" ]
				then 
					youtube-dl -x --audio-format mp3 "ytsearch1:$squery"
				else
					echo "Type a filename without an extension or quotation marks. E.G somemusic."
					read filename
					youtube-dl -x --audio-format mp3 --output "$filename.mp3" "ytsearch1:$squery"
					fi

}


searchorurl
read searchorurlvar

if [ "$searchorurlvar" = "2" ] || [ "$searchorurlvar" = "Search" ] || [ "$searchorurlvar" = "search" ] 
then
	echo "Type your search query:"
	read squery
	formatprompt
	read searchformat
    echo "Would you like to rename the file? Y for yes and N for no."
    read answer
	if [ "$searchformat" = "mp3" ] || [ "$searchformat" = "MP3" ] || [ "$searchformat" = "2" ]
	then
		downloadmp3searched
	else
		downloadmp4searched
	fi
else
	formatprompt
	read format
	echo "What is the URL for the file you would like to download?"
	read URL
    echo "Would you like to rename the file? Y for yes and N for no."
    read answer
	if [ "$format" = "mp3" ] || [ "$format" = "MP3" ] || [ "$format" = "2" ]
	then
		downloadmp3URL
	else
		downloadmp4URL
	fi
fi


