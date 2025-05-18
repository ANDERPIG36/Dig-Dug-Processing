void scavoMatrice() {
  casella = mappa[playerY][playerX];

  // Inizializza scavo
  for (int sy = 0; sy < 4; sy++) {
    for (int sx = 0; sx < 4; sx++) {
      int bit = 1 << (sy*4 + sx);
      scavo[sy][sx] = (casella & bit) != 0;
    }
  }

  // Scava in base alla direzione con pattern 2x2 centrato
  switch (ultimaMossa) {
  case 1: // SU
  case 2: // GIÙ
    // Scava due colonne centrali (1 e 2)
    for (int dx = 1; dx <= 2; dx++) {
      scavo[playerSubY][dx] = false;
      if (playerSubY+1 < 4) scavo[playerSubY+1][dx] = false;
    }
    break;

  case 3: // DESTRA
  case 4: // SINISTRA
    // Scava due righe centrali (1 e 2)
    for (int dy = 1; dy <= 2; dy++) {
      scavo[dy][playerSubX] = false;
      if (playerSubX+1 < 4) scavo[dy][playerSubX+1] = false;
    }
    break;
  }

  // Aggiorna la mappa
  int nuovoTerreno = 0;
  for (int sy = 0; sy < 4; sy++) {
    for (int sx = 0; sx < 4; sx++) {
      if (scavo[sy][sx]) {
        nuovoTerreno |= 1 << (sy * 4 + sx);
      }
    }
  }
  if(mappa[playerY][playerX]!=nuovoTerreno){
    staScavando=true;
    score+=10;
  }
  else if(playerFermo){
    staScavando=false;
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

    if(r.sbriciolamento>0){
      if(clock%12==0){
        r.sbriciolamento++;
      }
      if (r.sbriciolamento > 3) {
        r.sbriciolamento=-1;
        roccieCadute++;
      }
    }

    if(r.y < mappa[0].length && (mappa[r.y+1][r.x] & centroCasella) == 0){
      if(r.tempoCaduta==0){
        r.tempoCaduta=clock;
        r.isFalling=true;
      }
    }
    else if(r.isFalling){
        r.sbriciolamento++;
        r.isFalling=false;
    }
    
    if (r.x == playerX && r.y == playerY && (r.isFalling||r.sbriciolamento>0)) {
      morte();
      break;
    }
    if (r.isFalling&&(clock-r.tempoCaduta>50)){
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
      monsterTouchedDigDug.rewind();
      monsterTouchedDigDug.play();
      morte();
      break;
    }
  }
  
  for (Fygar f : fygar) {
    if (f.x == playerX && f.y == playerY) {
      monsterTouchedDigDug.rewind();
      monsterTouchedDigDug.play();
      morte();
      break;
    }
  }

  if(roccieCadute>1){
    drawFrutto=true;
    roccieCadute-=2;
  }
  
  if(playerX==5&&playerY==6&&drawFrutto){
    score+=((livello+3)%10)*100;
    drawFrutto=false;
  }
}
