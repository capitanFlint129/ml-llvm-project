export ONNX_DIR=/home/flint/onnxruntime-linux-x64-1.16.3
export LD_LIBRARY_PATH=${ONNX_DIR}:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/home/flint/onnxruntime-linux-x64-1.16.3/lib/:$LD_LIBRARY_PATH
export LIBRARY_PATH=${ONNX_DIR}:$LIBRARY_PATH
export PATH=${ONNX_DIR}/include:$PATH

./build/bin/opt \
  -poset-rl \
  -use-onnx \
  -ml-config-path=./config \
  model/POSET-RL/data/qsort2.ll \
  -o model/POSET-RL/data/qsort2_optimized.bc