#!/bin/bash

function dur()
{
for file in ./*
do
        if [[ "$file" != ./files ]]
        then
                if [[ "$file" != ./task.sh ]]
                then
                        if [[ "$file" = *.mp4 || "$file" = *.mov || "$file" = *.avi || "$file" = *.mp3 ]]
                        then
                                a=$(ffprobe -i "$file" -show_entries format=duration -v quiet -of csv="p=0" -sexagesimal);
                                echo $a>>$path/files/duration.txt
                        else
                                a="None";
                                echo $a>>$path/files/duration.txt
                        fi
                fi
        fi
done

for file in ./*
do
	if [[ "$file" != ./files ]]
	then
        	if [[ -d "${file}" ]]
        	then
                	cd "${file}";
                	dur $(ls ".");
			cd ..;
        	fi
	fi
done
}
mkdir files
path=$(pwd)
ls -l -R -b -I "files" -I "task.sh" | awk -F" " 'NF>3{i=9; while (i<NF) {printf("%s ", $i); i++;} printf("%s\t", $i)}NF>3{printf("%s\t%s %s\t%s\n", $5, $6, $7, $8)}'>./files/inf.txt
ls -l -R -b -I "files" -I "task.sh" | awk -F" " 'NF==9{print $9} NF>9{i=9; while (i<NF) {printf("%s ", $i); i++;} printf("%s\n", $i)}' | sed 's/.*\.//'>./files/format.txt
>./files/duration.txt
dur $(ls ".")
cd $path
echo "Name", "Size (bytes)", "Date (M:D)", "Time", "Format", "Duration (HH:MM:SS)" > ./files/res.xls
paste -d'\t' ./files/inf.txt ./files/format.txt ./files/duration.txt>>./files/res.xls
