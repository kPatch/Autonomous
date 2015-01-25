#!/bin/bash
if[$USER != 'root']
then
echo "REQUIRES ROOT, please run: sudo install_ompl.sh"
exit 0
else
echo "1. INSTALLING: Boost, CMake, Python, PyQt4, PyOpenGL, and pkg-config"
sudo apt-get install libboost-all-dev cmake python-dev python-qt4-dev python-qt4-gl python-opengl freeglut3-dev libassimp-dev

echo"2. INSTALLING: DOxygen, GraphViz, and ODE"
sudo apt-get install doxygen graphviz libode-dev

echo "3. PERFORMING: CMake build - Assuming you are in the omlapp directory"
mkdir -p build/Release
cd build/Release
cmake ../..

echo "4. INSTALLING: Py++ for Python bindings and GUI"
make installpyplusplus && cmake .
make update_bindings && make

echo "5. COMPILING: OMPL.app"
make

echo "6. COMPILING: test - Run the test programs"
make test

echo "7. COMPILING: doc - Generate documentation"
make doc

echo "8. INSTALLING the library"
sudo make install
