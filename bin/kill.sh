source color.dat
clear
printf "${RED}"
echo
echo ===============================
printf "${BLUE}"
echo     KILL $1 PROCESS
printf "${RED}"
echo ===============================
echo
printf "${NC}"

docker kill $1
docker rm $1
