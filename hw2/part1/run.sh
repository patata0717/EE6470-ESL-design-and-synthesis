clear
mkdir -p build
cd build
rm -rf *

# Modify filter_def.h
awk '/const bool verbal_tb/ {print "const bool verbal_tb = 0;"; next} 
     /const bool verbal_gaussian/ {print "const bool verbal_gaussian = 0;"; next} 
     /const bool verbal_laplacian/ {print "const bool verbal_laplacian = 0;"; next} 
     {print}' ../filter_def.h.in > temp && mv temp ../filter_def.h.in

cmake ..
make

start_time=$(date +%s%3N)
make run
end_time=$(date +%s%3N)

runtime_ms=$((end_time - start_time))
echo "Runtime: ${runtime_ms} ms"

make check
