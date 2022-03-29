if [[ $1 = "wc" ]];then
a="| wc -l"
v1="$2 $3 $4 $5 $6 $7 $8 $9"
else 
v1=$1
fi
ps aux | grep $v1 $a
