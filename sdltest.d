import core.stdc.stdio: printf;
import sdl, model, view;

int main(){
   ÇİZ çizmeye;   // model.d
   SAHNE sahne;   // view.d
   //TUŞLAR tuş;    // control.d
   
   scope(failure) {
      printf("-YAZILIM HATALI SONLANDI-\n");
      printf("=========================\n");
      printf("Hata bilgileri:\n");
   }

   if(SDL_Init(SDL_INIT_VIDEO) < 0) {
      throw new Exception("HATA: Uygun olmayan vidyo!");
   }
   
   // sahneKur
   SDL_Surface* ekran = SDL_SetVideoMode(sahne.genişliği,sahne.yüksekliği,0,0);
   
   if(ekran == null) {
      throw new Exception("HATA: Uygun olmayan sahne!");
   }
   scope (exit) { // sahneBitir
      SDL_Quit();
      printf("-YAZILIM HATASIZ SONLANDI-\n");
      printf("Hadi yine iyisin...:)\n");
   }
   int beyaz = SDL_MapRGB(ekran.format, 0xff, 0xff, 0xff);
 
   SDL_Rect çerçeve;
            çerçeve.w = cast(ushort)(sahne.genişliği - sahne.çerçeveKalınlığı);
            çerçeve.h = cast(ushort)(sahne.yüksekliği - sahne.çerçeveKalınlığı);
            çerçeve.x = cast(short)(ekran.w - çerçeve.w)/2;
            çerçeve.y = cast(short)(ekran.h - çerçeve.h)/2;
   SDL_FillRect(ekran, &çerçeve, beyaz);
   SDL_UpdateRect(ekran, 0, 0, ekran.w, ekran.h); 

   return çizmeye.başla(ekran, &çerçeve);  // sonsuz döngü
} // program sonu