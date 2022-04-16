#!/bin/bash
source color.dat
printf "${BLUE1}"
#echo ""
#echo "CHECK NETWORK CONNECTIONS"
#echo "========================="
if [ -f /volume1/sec/check.ck ]; then
  printf "${GREEN}"
  printf "[OK]"
else
  printf "${RED}"
  printf "[V1/sec NO CONNECTION]"
fi
#printf "--"
if [ -f /volume2/downloads2/check.ck ]; then
  printf "${GREEN}"
  printf "[OK]"
else
  printf "${RED}"
  printf "[V2/DL NO CONNECTION]"
fi
#printf " "
