#生成.js 和 .wasm文件

export TOTAL_MEMORY=67108864
export SOURCE_DECODER=./decoder
export FFMPEG_PATH=./ffmpeg-emcc
export WASM_PATH=./wasm

export EXPORTED_FUNCTIONS="[ \
    '_initDecoder'
]"

echo "Emscripten start..."
emcc ${SOURCE_DECODER}/decode_test.c \
    ${FFMPEG_PATH}/lib/libavformat.a \
    ${FFMPEG_PATH}/lib/libavcodec.a  \
    ${FFMPEG_PATH}/lib/libswresample.a \
    ${FFMPEG_PATH}/lib/libswscale.a \
    ${FFMPEG_PATH}/lib/libavutil.a \
    -O3 \
    -I "${FFMPEG_PATH}/include" \
    -s WASM=1 \
    -s TOTAL_MEMORY=${TOTAL_MEMORY} \
    -s ALLOW_MEMORY_GROWTH=1 \
    -s NO_EXIT_RUNTIME=1 \
    -s EXPORTED_FUNCTIONS="${EXPORTED_FUNCTIONS}" \
    -s EXPORTED_RUNTIME_METHODS="['ccall', 'addFunction']" \
    -s RESERVED_FUNCTION_POINTERS=14 \
    -s ASSERTIONS=0 \
    -o ${WASM_PATH}/ffmpeg.js

echo "Emscripten end..."

cd wasm
cp ffmpeg.js ffmpeg.wasm ../wasm_demo
