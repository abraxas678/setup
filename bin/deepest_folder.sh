find . -type d -printf '%d %p\0' | sort -zrn | sed -z 's/[0-9]* //; q'
