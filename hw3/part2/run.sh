clear
mkdir -p build
cd build
rm -rf *

# Modify filter_def.h
awk '/const bool verbal_tb/ {print "const bool verbal_tb = 1;"; next} 
     /const bool verbal_gaussian/ {print "const bool verbal_gaussian = 1;"; next} 
     /const bool verbal_laplacian/ {print "const bool verbal_laplacian = 1;"; next} 
     {print}' ../filter_def.h.in > temp && mv temp ../filter_def.h.in

cmake ..
make run
make check
