#!/bin/zsh

ls /home/slr/Pictures/bgs/*.jpg > /home/slr/Pictures/bgs/bgs.txt
ls /home/slr/Pictures/bgs/*.png >> /home/slr/Pictures/bgs/bgs.txt
python /home/slr/Pictures/bgs/ret.py /home/slr/Pictures/bgs/bgs.txt > /home/slr/Pictures/bgs/bg.txt

local bcknd
bcknd=("wal" "colorthief" "colorz" "haishoku" )

index=$(($RANDOM % 4))

export IMG=$(cat /home/slr/Pictures/bgs/bg.txt)
echo ${bcknd[$index+1]}
wal -q -i  $IMG --backend ${bcknd[$index+1]}
