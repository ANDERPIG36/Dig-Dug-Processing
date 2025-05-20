void mobIA(){
  convertiMatrice();
  
  for (Pooka p : pooka) {
    if(ultimoMostro){
      p.stato=3;
    }
    switch(p.stato){
      
    }
  }
  
  for (Fygar f : fygar) {
    
    if(ultimoMostro){
      f.stato=3;
    }
    else if(playerX >= f.x - 3 && playerX <= f.x + 3 && playerY >= f.y - 1 && playerY <= f.y + 1){
      if(!f.isShooting && clock%200==0){
        f.isShooting=true;
        f.stato=4;
        if (playerX > f.x) {
          //spara a destra
          f.direzioneAttacco=false;
        } 
        else if (playerX < f.x) {
          //spara a sinistra
          f.direzioneAttacco=true;
        } 
        else {
          if(ultimaMossa==3){
            //spara a destra
            f.direzioneAttacco=false;
          }
          else{
            //spara a sinistra
            f.direzioneAttacco=true;
          }
        }
      }
    }
    
    
    if(f.isShooting || f.statoAttacco>0){
      switch(f.statoAttacco){
        case -3:
          if(clock%140==0){
            f.statoAttacco = -2;
            f.isShooting=false;
          }
        break;
        case -2:
          if(clock%60==0){
            f.statoAttacco = f.isShooting ? -3 : -1;
          }
        break;
        case -1:
          if(clock%60==0){
            f.statoAttacco = f.isShooting ? -2 : 0;
          }
        break;
        case 0:
          if(clock%160==0){
            f.statoAttacco = f.direzioneAttacco ? -1 : 1;
          }
        break;
        case 1:
          if(clock%60==0){
            f.statoAttacco = f.isShooting ? 2 : 0;
          }
        break;
        case 2:
          if(clock%60==0){
            f.statoAttacco = f.isShooting ? 3 : 1;
            fygarFiring.rewind();
            fygarFiring.play();
          }
        break;
        case 3:
          if(clock%140==0){
            f.statoAttacco = 2;
            f.isShooting=false;
          }
        break;
      }
    }
  }
}

void convertiMatrice() {
  for (int y = 0; y < 13; y++) {
    for (int x = 0; x < 12; x++) {
      int cella = mappa[y][x];
      int val = 0;

      // Primo bit percorso: controlla bit 1 e 2 di mappa a 0
      if (((cella & (1 << 1)) == 0) && ((cella & (1 << 2)) == 0)) {
        val |= 1 << 0; // primo bit percorso acceso
      }

      // Secondo bit percorso: controlla bit 13 e 14 a 0
      if (((cella & (1 << 13)) == 0) && ((cella & (1 << 14)) == 0)) {
        val |= 1 << 1; // secondo bit percorso acceso
      }

      // Terzo bit percorso: controlla bit 7 e 11 a 0
      if (((cella & (1 << 7)) == 0) && ((cella & (1 << 11)) == 0)) {
        val |= 1 << 2; // terzo bit percorso acceso
      }

      // Quarto bit percorso: controlla bit 4 e 8 a 0
      if (((cella & (1 << 4)) == 0) && ((cella & (1 << 8)) == 0)) {
        val |= 1 << 3; // quarto bit percorso acceso
      }

      percorso[y][x] = val;
    }
  }
}
