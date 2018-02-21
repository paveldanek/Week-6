#! /bin/bash

cd ~
echo "LET'S CHECK THE SYSTEM'S RUNLEVEL"
who -r
echo "PRESS ENTER"
read
echo "LET'S SEE, WHAT YOUR CONFIGURED SEARCH PATH IS:"
systemctl -p UnitPath show
echo "PRESS ENTER"
read
echo "THIS IS WHERE MOST OF YOUR SYSTEM IS:"
pkg-config systemd --variable=systemdsystemunitdir
echo "PRESS ENTER"
read
echo "THIS IS WHERE MOST OF YOUR SYSTEM'S CONFIGURATION IS:"
pkg-config systemd --variable=systemdsystemconfdir
echo "PRESS ENTER"
read
echo "LET'S SEE HOW MANY AND WHICH UNITS ARE CURRENTLY RUNNUNG"
systemctl list-units | more
echo "PRESS ENTER"
read
echo "WHAT'S THE STATUS OF ONE OF THESE UNITS?"
systemctl status tmp.mount
echo "PRESS ENTER"
read
echo "ARE THERE ANY JOBS RUNNING (UNITS ACTIVATING, REACTIVATING, RESTARTING...)?"
systemctl list-jobs | more
echo "PRESS ENTER"
read
echo "NOW WE'LL CREATE A UNIT NAMED test1.target AND test2.target WITH DEPENDENCY"
echo "ON test1.target. WE'LL ACTIVATE test2.target AND VERIFY THEY ARE BOTH ACTIVE."
touch test1.target
touch test2.target
echo "[Unit]" >> test1.target
echo "Description=test 1" >> test1.terget
echo "[Unit]" >> test2.target
echo "Description=test 2" >> test2.target
echo "Wants=test1.target" >> test2.target
sudo mv test?.target /etc/systemd/system/
systemctl start test2.target
systemctl status test1.target test2.target
echo "PRESS ENTER"
read
systemctl stop test1.target test2.target
systemctl disable test1.target test2.target
cd /etc/systemd/system/
sudo rm test1.target test2.target
cd ~
echo "THAT'S IT. THANK YOU. PRESS ENTER"
read
