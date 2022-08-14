#include <libavcodec/avcodec.h>
#include <libavformat/avformat.h>
#include <libavutil/imgutils.h>
#include <libswscale/swscale.h>
#include <libswresample/swresample.h>

// #ifndef EM_PORT_API
// #	if defined(__EMSCRIPTEN__)
// #		include <emscripten.h>
// #		if defined(__cplusplus)
// #			define EM_PORT_API(rettype) extern "C" rettype EMSCRIPTEN_KEEPALIVE
// #		else
// #			define EM_PORT_API(rettype) rettype EMSCRIPTEN_KEEPALIVE
// #		endif
// #	else
// #		if defined(__cplusplus)
// #			define EM_PORT_API(rettype) extern "C" rettype
// #		else
// #			define EM_PORT_API(rettype) rettype
// #		endif
// #	endif
// #endif
 
void initDecoder() 
{
	   AVCodec  *codec = avcodec_find_decoder( AV_CODEC_ID_H264 );
	   if(codec != NULL)
	   {
	       printf("codec h264 init success.\n");
	   }
	   else 
	   {
	       printf("codec h264 init fail.\n");
	   }
}

int test()
{
	return 9;
}
