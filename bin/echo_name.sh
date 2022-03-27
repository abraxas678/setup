source color.dat
count=${#1}
source name.dat
if (($count > 1)); then
  name="$1 $2 $3 $4 $5 $6 $8 $9"
fi
counter="${#name}"
echo
zeichen="============"
startvalue=1
myname="..... $name ....."
for((i=$startvalue;i<=$counter;++i)) do
   zeichen="$zeichen="
done
echo $zeichen
echo $myname
echo $zeichen
