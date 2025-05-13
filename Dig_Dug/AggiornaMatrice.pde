void scavoMatrice(){
  casella = mappa[playerY][playerX];
  
  for (int sy = 0; sy < 4; sy++) {
    for (int sx = 0; sx < 4; sx++) {
      int bit = 1 << (sy*4 + sx);
      scavo[sy][sx] = (casella & bit) != 0;
    }
  }
  
  switch (ultimaMossa) {
    case 1: // su
    case 2: // giù
      for (int dx = 0; dx < 2; dx++) {
        int sx = playerSubX + dx;
        if (sx >= 0 && sx < 4) scavo[playerSubY][sx] = false;
      }
      break;
      
    case 3: // destra
    case 4: // sinistra
      for (int dy = 0; dy < 2; dy++) {
        int sy = playerSubY + dy;
        if (sy >= 0 && sy < 4) scavo[sy][playerSubX] = false;
      }
      break;
      
    default:
      scavo[playerSubY][playerSubX] = false;
  }
  
  int nuovoTerreno = 0;
  for (int sy = 0; sy < 4; sy++) {
    for (int sx = 0; sx < 4; sx++) {
      if (scavo[sy][sx]) {
        nuovoTerreno |= 1 << (sy * 4 + sx);
      }
    }
  }  
  
  mappa[playerY][playerX] = nuovoTerreno;
}

void aggiornaMatrice() {
  for(int r = 0; r < 13; r++){
    for(int c = 0; c < 12; c++){
      casella = mappa[r][c];
      
      // Bit 0 = bit 1 OR bit 4
      boolean bit1 = (casella & (1 << 1)) != 0;
      boolean bit4 = (casella & (1 << 4)) != 0;
      if (!bit1 && !bit4) {
        casella &= ~(1 << 0); // spegni bit 0
      }

      // Bit 3 = bit 2 OR bit 7
      boolean bit2 = (casella & (1 << 2)) != 0;
      boolean bit7 = (casella & (1 << 7)) != 0;
      if (!bit2 && !bit7) {
        casella &= ~(1 << 3); // spegni bit 3
      }

      // Bit 12 = bit 8 OR bit 13
      boolean bit8  = (casella & (1 << 8)) != 0;
      boolean bit13 = (casella & (1 << 13)) != 0;
      if (!bit8 && !bit13) {
        casella &= ~(1 << 12); // spegni bit 12
      }

      // Bit 15 = bit 11 OR bit 14
      boolean bit11 = (casella & (1 << 11)) != 0;
      boolean bit14 = (casella & (1 << 14)) != 0;
      if (!bit11 && !bit14) {
        casella &= ~(1 << 15); // spegni bit 15
      }
      
      // Bit 5,6,9,10 = bit 0 OR bit 3 OR bit 12 OR bit 15
      boolean bit0  = (casella & (1 << 0))  != 0;
      boolean bit3b = (casella & (1 << 3))  != 0;
      boolean bit12b= (casella & (1 << 12)) != 0;
      boolean bit15b= (casella & (1 << 15)) != 0;
      if (!bit0 && !bit3b && !bit12b && !bit15b) {
        casella &= ~(1 << 5);
        casella &= ~(1 << 6);
        casella &= ~(1 << 9);
        casella &= ~(1 << 10);
      }
      
      mappa[r][c] = casella;
    }
  }
}

void controlloEventi() {
  for(Roccia r : roccia){
    int centroCasella = (1 << 5) | (1 << 6) | (1 << 9) | (1 << 10);
    if(r.y + 1 < mappa[0].length && (mappa[r.x][r.y + 1] & centroCasella) == 0){
      r.isFalling=true;
    }
    else if(r.isFalling){
      //mettere distruzione roccia
    }
    
    if (r.x == playerX && r.y == playerY && r.isFalling) {
      morte();
    }
    if (r.isFalling){
      r.subY++;
      if(r.subY>3){
        r.subY -= 4;
        r.y++;
      }
    }
    
    for (Pooka p : pooka) {
      if (p.x == r.x && p.y == r.y) {
        //schiaccia mostro
      }
    }
    
    for (Fygar f : fygar) {
      if (f.x == r.x && f.y == r.y) {
        //schiaccia mostro
      }
    }
    
  }
  
  for (Pooka p : pooka) {
    if (p.x == playerX && p.y == playerY) {
      morte();
    }
  }
  
  for (Fygar f : fygar) {
    if (f.x == playerX && f.y == playerY) {
      morte();
    }
  }

}
