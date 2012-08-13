module model;

import sdl, view, control;

public struct ÇİZ {
    SAHNE sahne;   // view.d
    TUŞLAR tuş;    // control.d

    bool başla(SDL_Surface* ekran, SDL_Rect* çerçeve) {
   	    double HIZLAN = 0.0123456789;
	    double YAVAŞLA = 0.998754321;
	    double nXkonumu = sahne.genişliği /2;
	    double nYkonumu = sahne.yüksekliği/2;
	    double nXivmesi = 0;
	    double nYivmesi = 0;

	    while (true) {
	        if(tuş.sol) nXivmesi -= HIZLAN;
	        if(tuş.sağ) nXivmesi += HIZLAN;
	        if(tuş.üst) nYivmesi -= HIZLAN;
	        if(tuş.alt) nYivmesi += HIZLAN;
	        nXivmesi *= YAVAŞLA;
	        nYivmesi *= YAVAŞLA;
	        if(nXkonumu > cast(double)(sahne.genişliği - sahne.çerçeveKalınlığı) ||
	          (nXkonumu < cast(double)sahne.çerçeveKalınlığı)) {
	           nXkonumu -= nXivmesi;
	           nXivmesi = -nXivmesi * YAVAŞLA;
	        }
	        if(nYkonumu > cast(double)(sahne.yüksekliği - sahne.çerçeveKalınlığı) ||
	          (nYkonumu < cast(double)sahne.çerçeveKalınlığı)) {
	           nYkonumu -= nYivmesi;
	           nYivmesi = -nYivmesi * YAVAŞLA;
	        }
	        nXkonumu += nXivmesi;
	        nYkonumu += nYivmesi;
	        SDL_FillRect(ekran, çerçeve, SDL_MapRGB(ekran.format, 0xff, 0xff, 0xff));
	        if(sahne.circleFill(ekran, cast(int)nXkonumu,
	                                   cast(int)nYkonumu, sahne.yuvarlakÇapı, 0)) {
	           SDL_Flip(ekran);
	        }
	        if(tuş.kontroEt()) return false;
	    } // sonsuz döngü
	    return true;
    }
}