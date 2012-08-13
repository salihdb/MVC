module view;

import sdl, std.math;

public struct SAHNE {
	int genişliği   	 = 640;
    int yüksekliği  	 = 480;
    int çerçeveKalınlığı = 40;
    int yuvarlakÇapı     = 21;

	bool circleFill(SDL_Surface* gScreen, int x, int y, int r, int c) {
	  	for (int i = 0; i < 2 * r; i++) {
	  		if ((y - r + i) >= 0 && (y - r + i) < yüksekliği) {
		      	int len = cast(int)sqrt(cast(float)(r * r - (r - i) * (r - i))) * 2;
		      	int xofs = x - len / 2;
		      
		      	if (xofs < 0) {
		        	len += xofs;
		        	xofs = 0;
		      	}
		      
		      	if (xofs + len >= genişliği) {
		        	len -= (xofs + len) - genişliği;
		      	}
		      	
		      	int pitch = gScreen.pitch / 4;
		      	int ofs = (y - r + i) * pitch + xofs;
		      
		      	for (int j = 0; j < len; j++) {
		        	(cast(uint*)gScreen.pixels)[ofs + j] = c;
		      	}
	    	}
	  	}
	  	return true;
	}
}