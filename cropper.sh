#!/bin/bash

for file in imgs/*.png
do
	echo ./"$file"
	echo ./faces/"$file"
	python3 crop.py lbpcascade_animeface/lbpcascade_animeface.xml ./"$file" ./faces/"$file"
done
