#!/bin/bash

# Learn more about bash shell script
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
sudo apt-get install cmake -y

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
sudo ln -s gcc-4.9 gcc
sudo ln -s g++-4.9 g++
sudo ln -s cpp-4.9 cpp
cd ~

# Install Valgrind
echo "=> Installing Valgrind"
sudo apt-get install valgrind -y

# Install OpenMPI
echo "=> Installing Open MPI"
sudo wget https://www.open-mpi.org/software/ompi/v1.8/downloads/openmpi-1.8.1.tar.gz
sudo apt-get install libibnetdisc-dev -y
sudo tar -xvf openmpi-1.8.1.tar.gz
cd openmpi-1.8.1
sudo ./configure --prefix="/home/$USER/.openmpi"
sudo make
sudo make install
export PATH="$PATH:/home/$USER/.openmpi/bin"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/home/$USER/.openmpi/lib/"

# Install Boost Libraries
echo "=> Installing Boost Libraries"
sudo apt-get install libboost-all-dev -y

# Install Eigen3
echo "=> Installing Eigen"
sudo apt-get install libeigen3-dev -y

# Install Blitz++
echo "=> Installing Blitz++"
sudo apt-get install libblitz-doc libblitz0-dev libblitz0ldbl -y

# Install QuantLib
sudo wget http://pkgs.fedoraproject.org/repo/extras/QuantLib/QuantLib-1.4.tar.gz/3601f0180a0eae4a6c2686cade6ec04f/QuantLib-1.4.tar.gz
sudo tar xvf QuantLib-1.4.tar.gz -C /usr/local/lib/
cd /usr/local/lib/QuantLib-1.4/
sudo ./configure
sudo make
sudo make install
