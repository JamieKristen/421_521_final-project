#! /bin/bash
echo welcome
echo enter username
read username 
x=$(grep $username usernames.txt)
echo $x
if [ $x = $username ]
then
	echo welcome back, $username
else
	echo welcome, $username
	echo $username >> usernames.txt
fi
echo smile for the camera!
raspistill  -o $username.jpg
temp=$(grep Temperature weather.txt| cut -c17-20)
cloudy=$(grep -c cloudy weather.txt)
sunny=$(grep -c sunny weather.txt)
echo athletic or regular clothes?
read type
echo $type
if [ $temp > 75 ]
then
	echo wear short sleeves
else
	echo wear a jacket
fi
if [ $cloudy > 0 ]
then
	echo its cloudy
elif [ $sunny > 0 ]
then
	echo It is sunny, dont forget your sunscreen
fi
if [ $temp > 75 ]
then
	if [$type = regular]
		then
		echo Try this outfit	
		R=$((RANDOM % 3 + 1 ))
		convert +append clothes/Warm/Regular/Tops$R.JPG clothes/Warm/Regular/Bottoms/$R.JPG montage.jpg 
		pqiv montage.jpg
	else 
		echo Try this outfit
		convert +append clothes/Warm/Athletic/Tops/$R.JPG clothes/Warm/Athletic/Sportsbra/$R.JPG montage.jpg
		convert +append montage.jpg clothes/Warm/Athletic/Bottoms/$R.JPG montage.jpg
		pqiv montage.jpg
	fi
else
	if [$type = regular]
		then
		echo hello
		echo Try this outfit
		R=$(( RANDOM % 3 + 1 ))
		convert +append clothes/Cold/Regular/Jackets/$R.JPG  clothes/Cold/Regular/Tops/$R.JPG montage.jpg
		convert +append montage.jpg clothes/Cold/Regular/Bottoms/$R.JPG montage.jpg
		pqiv  montage.jpg
	else
		echo Try this outfit
		echo hi
		R=$(( RANDOM % 3 + 1 ))
		convert +append clothes/Cold/Athetic/Tops/$R.JPG clothes/Cold/Athetic/Bottoms/$R.JPG montage.jpg
		pqiv montage.jpg
	fi
fi
