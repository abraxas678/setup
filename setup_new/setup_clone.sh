mkdir /volume2/
mkdir /volume2/docker_final
cd /volume2/docker_final
rm -rf setup_new
git clone https://github.com/abraxas678/setup_new.git
cd setup_new
chmod +x *
./setup_new.sh
