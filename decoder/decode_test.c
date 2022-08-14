// #include <libavcodec/avcodec.h>
// #include <libavformat/avformat.h>
// #include <libavutil/imgutils.h>
// #include <libswscale/swscale.h>
// #include <libswresample/swresample.h>
// #include <emscripten/emscripten.h>

// void EMSCRIPTEN_KEEPALIVE initDecoder() 
// {
// 	   AVCodec  *codec = avcodec_find_decoder( AV_CODEC_ID_H264 );
// 	   if(codec != NULL)
// 	   {
// 	       printf("codec h264 init success.");
// 	   }
// 	   else 
// 	   {
// 	       printf("codec h264 init fail.");
// 	   }
// }

#include <libavcodec/avcodec.h>
#include <libavformat/avformat.h>
#include <libavutil/imgutils.h>
#include <libswscale/swscale.h>
#include <libswresample/swresample.h>

void initDecoder() 
{
	   AVCodec  *codec = avcodec_find_decoder( AV_CODEC_ID_H264 );
	   if(codec != NULL)
	   {
	       printf("codec h264 init success.");
	   }
	   else 
	   {
	       printf("codec h264 init fail.");
	   }
}