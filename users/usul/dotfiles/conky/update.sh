#!/usr/bin/env bash
killall -q -r conky

cp conky.template config

sed -i 's/%background/'"$(xrdb -query -all | grep '^*.background' | head -1 | cut -f2 | cut -b 2-)"'/g' config
sed -i 's/%color1/'"$(xrdb -query -all | grep '^*.color1' | head -1 | cut -f2 | cut -b 2-)"'/g' config
sed -i 's/%color2/'"$(xrdb -query -all | grep '^*.color2' | head -1 | cut -f2 | cut -b 2-)"'/g' config
sed -i 's/%color3/'"$(xrdb -query -all | grep '^*.color3' | head -1 | cut -f2 | cut -b 2-)"'/g' config
