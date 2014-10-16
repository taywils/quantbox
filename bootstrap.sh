#!/bin/bash

# Wanna become a shell script'in greybeard?
# http://folk.ntnu.no/geirha/bashguide.pdf

# Prevent console prompts for passwords and setting up home directories
echo "=> Disable interactive prompts"
export DEBIAN_FRONTEND=noninteractive

# Update Debian package repositories
echo "=> Updating Debian packages"
sudo apt-get update -y

# Install the basics for any Ubuntu system
echo "=> Installing build-essential"
sudo apt-get install build-essential -y

# Install advanced Debian apt commands
echo "=> Installing advanced Debian apt commands"
sudo apt-get install python-software-properties -y

# Install some nice tools
echo "=> Installing some nice system tools"
sudo apt-get install vim -y
sudo apt-get install tree -y
sudo apt-get install htop -y
sudo apt-get install gnuplot -y
sudo apt-get install curl -y
sudo apt-get install openssl -y
sudo apt-get install nfs-kernel-server portmap -y

# Install Git
echo "=> Installing Git"
sudo apt-get install git-core -y

# Install GNU Scientific Library
echo "=> Installing GNU Scientific Libraries"
sudo apt-get install gsl-bin libgsl0-dev -y

# Install GCC
echo "=> Installing GCC"
sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
sudo apt-get update
sudo apt-get install gcc-4.9 g++-4.9 cpp-4.9 -y
# Clean up old build-essentials versions of GCC and add sym link
cd /usr/bin
sudo rm gcc g++ cpp
sudo ln -s /usr/bin/gcc-4.9 gcc
cd ~
