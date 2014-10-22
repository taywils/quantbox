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
echo "=> Installing QuantLib"
sudo wget http://pkgs.fedoraproject.org/repo/extras/QuantLib/QuantLib-1.4.tar.gz/3601f0180a0eae4a6c2686cade6ec04f/QuantLib-1.4.tar.gz
sudo tar xvf QuantLib-1.4.tar.gz -C /usr/local/lib/
cd /usr/local/lib/QuantLib-1.4/
sudo ./configure
sudo make
sudo make install
cd ~

# Prepare to install Python Tools
echo "=> Installing Python Tools"
sudo apt-get install build-essential python-dev -y
# Numpy, SciPy, Cython, Pandas
sudo apt-get install python-numpy -y
sudo apt-get install cython -y
sudo apt-get install python-scipy -y
sudo apt-get install python-pip -y
sudo pip install pandas

# GNU Octave
echo "=> Installing GNU Octave"
sudo add-apt-repository ppa:picaso/octave -y
sudo apt-get update -y
sudo apt-get install octave -y

# R Programming Language
echo "=> Installing R Programming Language"
sudo apt-get install r-base r-base-dev -y

# Sublime Text 3
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
sudo apt-get update -y
sudo apt-get install -y sublime-text-installer

# Java 8
echo "=> Installing Oracle Java 8"
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update -y
# Automatically accept Oracle license agreement
sudo echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get install oracle-java8-installer -y
sudo apt-get install oracle-java8-set-default -y
export JAVA_HOME=/usr/lib/jvm/java-8-oracle

# Eclipse IDE CDT
echo "=> Installing Eclipse Luna with CDT"
cd /opt
sudo wget http://ftp.osuosl.org/pub/eclipse/technology/epp/downloads/release/luna/SR1/eclipse-cpp-luna-SR1-linux-gtk-x86_64.tar.gz
sudo tar -zxvf eclipse-cpp-luna-SR1-linux-gtk-x86_64.tar.gz
sudo rm eclipse-cpp-luna-SR1-linux-gtk-x86_64.tar.gz
sudo ln -s /opt/eclipse/eclipse /usr/local/bin/eclipse
cd ~
