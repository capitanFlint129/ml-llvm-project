export ONNX_DIR=~/onnxruntime-linux-x64-1.16.3
export LD_LIBRARY_PATH=${ONNX_DIR}:$LD_LIBRARY_PATH
export LIBRARY_PATH=${ONNX_DIR}:$LIBRARY_PATH
export PATH=${ONNX_DIR}/include:${ONNX_DIR}/lib:$PATH


export MY_INSTALL_DIR_GRPC=$HOME/.local
export PATH="MY_INSTALL_DIR_GRPC/bin:$PATH"

cmake -G "Unix Makefiles" -S ../llvm -B . \
	-DCMAKE_BUILD_TYPE="Release" \
	-DLLVM_ENABLE_PROJECTS="clang;IR2Vec;ml-llvm-tools;mlir;MLCompilerBridge" \
	-DLLVM_TARGETS_TO_BULID="X86" \
	-DLLVM_ENABLE_ASSERTIONS=ON \
	-DCMAKE_EXPORT_COMPILE_COMMANDS=1 \
	-DABSL_ENABLE_INSTALL=ON \
	-DCMAKE_C_COMPILER_LAUNCHER=ccache \
	-DCMAKE_CXX_COMPILER_LAUNCHER=ccache \
	-DONNXRUNTIME_ROOTDIR=$ONNX_DIR \
	-DTENSORFLOW_AOT_PATH=~/.local/lib/python3.9/site-packages/tensorflow \
	-DLLVM_TF_AOT_RUNTIME=~/Загрузки/llvm-17
