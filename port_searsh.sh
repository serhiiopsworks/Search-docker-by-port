#!/bin/bash
docker ps -a -q  >> /tmp/ttt.txt                 # find numeric IDs of all docker and put it into file
declare -a myarray                               # array declaration 
port=20007                                       # set port, that you need to find
i=0                                              # ietrator for loop

readarray myarray</tmp/ttt.txt                   # load data into array from file
echo "Total containers number: ${#myarray[@]}"   # show size of array

while (( ${#myarray[@]} > i ))                   # begin "while" block
do
    ii=${myarray[i++]}                           # increase iterator
    line=$(docker port $ii)                      # get info about port of certain container
if                                               # begin "if" block
    echo "$line" | grep -i "$port">/dev/null     # if this info fits the condition
then
    echo "$ii"                                   # show container's numeric ID
    echo "$line"                                 # show inf about port
fi                                               # end "if" block
done                                             # end "while" block
