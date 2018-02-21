#! /bin/bash

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
#echo "PRESS ENTER"
#read

# I had to mark the following section as a note NOT to run it. It won't work.
# Does anybody have any idea, how this is supposed to be implemented? I went by the book,
# but as soon I tried the [Unit] line, it wasn incorrect. How do I script that?
#
#echo "NOW WE'LL CREATE A UNIT NAMED test1.target AND test2.target WITH DEPENDENCY ON test1.target. WE'LL ACTIVATE test2.target AND VERIFY THEY ARE BOTH ACTIVE."
#
#[Unit]
#Description=test 1
#
#[Unit]
#Description=test 2
#Wants=test1.target
#
#systemctl start test2.target
#systemctl status test1.target test2.target
#
#echo "PRESS ENTER"
#read
#systemctl stop test1.target
#systemctl stop test2.target
#systemctl disable test1.target
#systemctl disable test2.target
#

echo "THAT'S IT. THANK YOU. PRESS ENTER"
read
