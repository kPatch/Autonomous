#!/bin/bash
if[$USER != 'root']
then
echo "REQUIRES ROOT, please run: sudo install_ompl.sh"
exit 0
else
#Install Boost, CMake, Python, PyQt4, PyOpenGL, and pkg-config
sudo apt-get install libboost-all-dev cmake python-dev python-qt4-dev python-qt4-gl python-opengl freeglut3-dev libassimp-dev

#Install DOxygen, GraphViz, and ODE
sudo apt-get install doxygen graphviz libode-dev

#Assuming you are in the omlapp directory
mkdir -p build/Release
cd build/Release
cmake ../..

#If you want Python bindings or a GUI, type the following two commands:
make installpyplusplus && cmake . # download & install Py++
make update_bindings

#Compile OMPL.app
make

#Run the test programs
make test

#Generate documentation
make doc

#Install the library
sudo make install



