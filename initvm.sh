###################################################
# CONFIG
###################################################

# NOTHING (this used to be more complicated..)

###################################################
# PACKAGE INSTALL
###################################################

# needed for building stuff
apt-get update
apt-get -y install make git nasm dos2unix

###################################################
# WATERBOX DEVELOPMENT ENVIRONMENT
###################################################

# midipix must go here. dont wrestle with symlinking it to /share/midipix-prebaked, it's not worth the trouble
rm -rf /home/moi
mkdir /home/moi
cp -r /share/midipix-prebaked /home/moi/midipix

# activate midipix
echo export PATH=/home/moi/midipix/nt64/release/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin >> /home/vagrant/.bashrc

###################################################
# FINAL SETUP
###################################################

# NOTHING (this used to be more complicated..)

