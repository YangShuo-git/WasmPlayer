if [ -d "ffmpeg-emcc" ]; then
    rm -rf ffmpeg-emcc
    mkdir ffmpeg-emcc
else
    mkdir ffmpeg-emcc
fi

cd ffmpeg-4.4.1

echo "------build ffmpeg-4.4.1 start"
make clean

emconfigure ./configure --cc=emcc --cxx=em++ --ar=emar  \
 --enable-cross-compile --prefix=../ffmpeg-emcc/ \
 --arch=x86_32 --cpu=generic --enable-gpl \
 --enable-version3 --disable-avdevice  \
 --disable-postproc --disable-avfilter \
 --disable-programs --disable-logging \
 --disable-everything --enable-avformat  \
 --enable-decoder=hevc --enable-decoder=h264 --enable-decoder=h264_qsv \
 --enable-decoder=hevc_qsv \
 --enable-decoder=aac \
 --disable-ffplay --disable-ffprobe  --disable-asm \
 --disable-doc --disable-devices --disable-network \
 --disable-hwaccels \
 --disable-parsers --disable-bsfs --disable-debug \
 --enable-protocol=file --disable-indevs --disable-outdevs \
 --enable-parser=hevc --enable-parser=h264

make
sudo make install

echo "------build ffmpeg-4.4.1 end"

