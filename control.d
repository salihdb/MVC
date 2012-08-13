module control;

import sdl;

public struct TUŞLAR {
	bool sol, sağ, üst, alt;
	SDL_Event event;

	bool kontroEt() @property {
	    while (SDL_PollEvent(&event)) {
            if(event.type == SDL_KEYDOWN) {
	            switch(event.key.keysym.sym) {
	               case SDLK_LEFT   : sol = true; break;
	               case SDLK_RIGHT  : sağ = true; break;
	               case SDLK_UP     : üst = true; break;
	               case SDLK_DOWN   : alt = true; break;
	               default          : break;
	            }
	        } else if(event.type == SDL_KEYUP) {                    
	            switch(event.key.keysym.sym) {
	               case SDLK_ESCAPE : return true; // çıkış
	               case SDLK_LEFT   : sol = false; break;
	               case SDLK_RIGHT  : sağ = false; break;
	               case SDLK_UP     : üst = false; break;
	               case SDLK_DOWN   : alt = false; break;
	               default          : break;
	            }
         	} else if(event.type == SDL_QUIT) {
            	return true; // çıkış
         	}
      	} // tuş döngüsü
      	return false;
	}
}