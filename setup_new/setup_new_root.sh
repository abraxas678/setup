#!/bin/bash
cd /root
git clone git@github.com:abraxas678/root.git
cd /root/root
#mv /root/root/* /root/
cp -r /root/root/* /root
rm -rf /root/root

