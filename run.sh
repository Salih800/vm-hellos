#!/bin/bash
while true
do 
printf '%s	' "$(date)" >> file.txt
if ls -f *.plot 
then
echo 'File is found and sending to wasabi...' >> file.txt
ls *.plot >> /root/outputs.txt
aws s3 mv --profile wasabi --endpoint-url=https://s3.eu-central-1.wasabisys.com plot-k32*.plot s3://chiasalihcakmak700/plots/
#rclone mv *.plot wasabi:chiasalihcakmak700/plots/ -P
else 
echo 'File is not found' >> file.txt
sleep 600
fi
done
