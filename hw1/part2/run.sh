clear
cd build
rm -rf *

# Modify filter_def.h
awk '/const bool verbal_tb/ {print "const bool verbal_tb = 0;"; next} 
     /const bool verbal_gaussian/ {print "const bool verbal_gaussian = 0;"; next} 
     /const bool verbal_laplacian/ {print "const bool verbal_laplacian = 0;"; next} 
     {print}' ../filter_def.h > temp && mv temp ../filter_def.h

cmake ..
make run
make check
