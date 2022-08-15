#生成.js 和 .wasm文件

export TOTAL_MEMORY=67108864
export SOURCE_DECODER=./web_client
export FFMPEG_PATH=./ffmpeg-emcc
export WASM_PATH=./wasm

export EXPORTED_FUNCTIONS="[ \
    '_initDecoder', \
    '_GetBuffer', \
    '_Decode', \
    '_GetWidth', \
    '_GetHeight', \
    '_GetRenderData'
]"

echo "Emscripten start..."
emcc ${SOURCE_DECODER}/decode.c\
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
    -s EXPORTED_FUNCTIONS="${EXPORTED_FUNCTIONS}" \
    -s EXPORTED_RUNTIME_METHODS="[ 'ccall' ]" \
    -o ${WASM_PATH}/ffmpeg.js

echo "Emscripten end..."

cd wasm
cp ffmpeg.js ffmpeg.wasm ../3rdlibs/nginx-1.22.0/build/html


