#!/bin/bash
function dur 
{
for file in ./*
do
	if [[ "$file" != ./files ]]
	then
		if [[ "$file" != ./task.sh ]]
		then
			if [[ "$file" = *.mp4 || "$file" = *.mov || "$file" = *.avi || "$file" = *.mp3 ]]
        		then
                		a=$(ffprobe -i $file -show_entries format=duration -v quiet -of csv="p=0" -sexagesimal);
        			echo $a>>$path/files/duration.txt
			else
                		a="None";
				echo $a>>$path/files/duration.txt
        		fi
		fi
	fi
done
}

for dir in ./*
do
	if [[ -d "${file}" ]]
	then
		cd "${file}";
		dur $(ls ".");
	fi
done

