==================================================================
WATERBOXDEV is the environment required for building waterbox cores
==================================================================

BACKGROUND INFORMATION

Waterbox cores are build with a customized `midipix` toolchain.
The art to building the toolchain from scratch has been lost. It required months of labor and human sacrifices but little more is known.
Ideally we would recover this lost art art (especially so waterbox inner-workings can be finetuned); but for now, we're providing the prebuilt toolchain. 

Since most of us are windows developers, and this toolchain runs on linux only, we use VAGRANT to setup a VM.
It is a little overpowered, but it lets the same steps work on every workstation OS, and might even let us automate waterbox core builds

STOP HERE AND DO THIS IF YOU ARE USING LINUX AND DON'T WANT TO USE VAGRANT:
1. copy share/midipix-prebaked to /home/moi/midipix
2. put /home/moi/midipix/nt64/release/bin in path
3. Do not substitute any other word for "moi". For instance, do not use "/home/coolguy/midipix" or "/home/improviser/midipix" or "/home/likestofail/midipix". 
   The above steps must be followed exactly, and you must use "/home/moi/midipix" verbatim.
4. Be aware that if we ever bring the midipix toolchain building-from-sources back to life, you may need to use waterboxdev in order to do that effectively, or at all.

==================================================================

PREPARING 

0. On windows 7, make sure you have powershell 3.0 installed: https://www.microsoft.com/en-us/download/details.aspx?id-34595 ; Windows6.1-KB2506143-x64.msu

1a. Install virtualbox (tested 6.0.12)
1b. Install virtualbox guest additions

2. Install vagrant (https://www.vagrantup.com/downloads.html) (tested 2.2.6. note, this version is known not to work with virtualbox 6.1)
Watch out for it's obnoxious C:\HashiCorp\Vagrant\ default directory.
Please be patient, at one point the vagrant installer was obnoxiously slow. When you later uninstall it, please be patient again. May depend on your disk or system.
FYI, this put C:\HashiCorp\Vagrant\bin in your system %PATH% environment

3. Clone waterboxdev to something like c:\waterboxdev

4. Customize Vagrantfile's memory and cpus to suit your system (default is 6 cpus and 3GiB ram)

-------------------------------------

DEVELOPMENT LOOP

1. open a command prompt to the c:\waterboxdev. you can use a bash shell from msys as well, if you wish, if you take care to setup the environment correctly (see %PATH% above)
2. run `vagrant up` to boot the VM
    (the first time you do this, a VM will have to download; it's cached in `%home%/.vagrant.d` so this won't happen again. The VM is ~390MB.)
3. run `vagrant ssh` to connect to the VM, and from here on out I'll assume you're SSH'd to the VM
4. clone bizhawk if you haven't already; I suggest cloning to /share/bizhawk as it will make your development easier (you can test the emulator in windows immediately after building a core)
    (it may be difficult to clone bizhawk here using tortoisegit due to it's apparently under the control of the waterboxdev repository. You can do it in a temp directory elsewhere and then move it in via explorer)
4. Build the core you want. This is done by finding the core directory in the /share/bizhawk/waterbox directory and running `make -j`
5. Place the .wbx core in the the bizhawk output/dll directory. Note that you should remove the .gz committed version of the core first.

DEVELOPMENT LOOP (TIPS)

1. You will wish to automate building + copying the *.wbx into the bizhawk output/dll dir.
    For instance, for libsnes, I made a `build.sh` consisting of `make -j && gzip -c libsnes.wbx > ../../output/dll/libsnes.wbx.gz`
    You may need to run `dos2unix` on `build.sh` if you made it in notepad
    Perhaps we should commit these for each core? Sometimes details may vary a little bit (may want a special script for building without LTO or optimizing and then a script for making final build for commit?)
2. You can also use `make -f waterbox-Makefile.all` from the /share/bizhawk/waterbox directory to test building all waterbox cores
3. You can improve iteration time by temporarily removing `-flto` from a `Makefile`
4. several cores (picodrive, ss) take a very long time to build at first; there are large CPU files to compile, and then there is a long link time. Make sure to disable LTO for those

DEVELOPMENT LOOP (ENDING WORK FOR THE DAY)

1. gzip the core you worked on, with a command such as 
1. exit the SSH session with `exit`
2. run `vagrant halt` to nicely stop the VM

-------------------------------------

CLEANING UP

1. run `vagrant destroy` to zap the VM. if you've been developing from the `share` dir like I have suggested, you won't lose any work.
note - the VM that vagrant downloaded will still be in c:\users\yourname\.vagrant.d\

==================================================================

