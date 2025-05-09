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

void controlloCollisioni() {
  for (int i = 0; i < roccia.length; i++) {
    if (roccia[i] != null && roccia[i].x == playerX && roccia[i].y == playerY) {
      morte();
    }
  }

  for (int i = 0; i < pooka.length; i++) {
    if (pooka[i] != null && pooka[i].x == playerX && pooka[i].y == playerY) {
      morte();
    }
  }

  for (int i = 0; i < fygar.length; i++) {
    if (fygar[i] != null && fygar[i].x == playerX && fygar[i].y == playerY) {
      morte();
    }
  }
}
