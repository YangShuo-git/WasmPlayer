#include <libavcodec/avcodec.h>
#include <libavformat/avformat.h>
#include <libavutil/imgutils.h>
#include <libswscale/swscale.h>
#include <libswresample/swresample.h>

#ifndef EM_PORT_API
#	if defined(__EMSCRIPTEN__)
#		include <emscripten.h>
#		if defined(__cplusplus)
#			define EM_PORT_API(rettype) extern "C" rettype EMSCRIPTEN_KEEPALIVE
#		else
#			define EM_PORT_API(rettype) rettype EMSCRIPTEN_KEEPALIVE
#		endif
#	else
#		if defined(__cplusplus)
#			define EM_PORT_API(rettype) extern "C" rettype
#		else
#			define EM_PORT_API(rettype) rettype
#		endif
#	endif
#endif
 
EM_PORT_API(int) initDecoder() 
{
	   AVCodec  *codec = avcodec_find_decoder( AV_CODEC_ID_H264 );
	   if(codec != NULL)
	   {
	       fprintf(stderr, "codec h264 init success.");
		   return 1;
	   }
	   else 
	   {
	       fprintf(stderr, "codec h264 init fail.");
		   return -1;
	   }

	   return 0;
}

EM_PORT_API(int) test()
{
	fprintf(stderr, "codec h264 init fail.");
	return 9;
}
