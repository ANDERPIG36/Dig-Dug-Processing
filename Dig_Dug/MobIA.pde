/*
void mobIA(){
  convertiMatrice();
  
  for (Pooka p : pooka) {
    
    if(ultimoMostro){
      p.stato=3;
    }
    switch(p.stato){
      case 0:
      case 1:
        if(clock%100==0){
          p.spettro = false;
          pookaGreedy(p);
          if(p.nMosse>50){
            p.nMosse=0;
            p.stato=2;
            
          }
        }
        break;
      case 2:
        p.nMosse=0;
        p.spettro=true;
        if(clock%100==0){
          moveSpettroPooka(p);
        }
        break;
      case 3:
        if(clock%100==0){
          p.spettro = false;
          pookaGreedy(p);
          if(p.nMosse>30){
            p.nMosse=0;
            p.stato=2;
           
          }
        }
        break;
    }
  }
  
  for (Fygar f : fygar) {
    
    if(ultimoMostro){
      f.stato=3;
    }
    else if(playerX >= f.x - 3 && playerX <= f.x + 3 && playerY >= f.y - 1 && playerY <= f.y + 1 && f.gonfiore<=0){
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
          if(clock%60==0){
            f.statoAttacco = -2;
            f.isShooting=false;
          }
        break;
        case -2:
          if(clock%20==0){
            f.statoAttacco = f.isShooting ? -3 : -1;
          }
        break;
        case -1:
          if(clock%20==0){
            f.statoAttacco = f.isShooting ? -2 : 0;
          }
        break;
        case 0:
          if(clock%140==0){
            f.statoAttacco = f.direzioneAttacco ? -1 : 1;
          }
        break;
        case 1:
          if(clock%20==0){
            f.statoAttacco = f.isShooting ? 2 : 0;
          }
        break;
        case 2:
          if(clock%20==0){
            f.statoAttacco = f.isShooting ? 3 : 1;
            fygarFiring.rewind();
            fygarFiring.play();
          }
        break;
        case 3:
          if(clock%60==0){
            f.statoAttacco = 2;
            f.isShooting=false;
          }
        break;
      }
    }
    
    switch (f.stato) {
      case 0:
      case 1:
        if (clock % 100 == 0 && !f.isShooting) {
          f.spettro = false;
          fygarGreedy(f);
          if (f.nMosse > 20) {
            f.nMosse    = 0;
            f.stato     = 2;
          }
        }
        break;
      case 2:
        if (clock % 100 == 0) {
          moveSpettroFygar(f);
        }
        break;
      case 3:
        if (clock % 100 == 0 && !f.isShooting) {
          f.spettro = false;
          fygarGreedy(f);
          if (f.nMosse > 20) {
            f.nMosse    = 0;
            f.stato     = 2;
          }
        }
        break;
    }

  }
}


void pookaGreedy(Pooka m) {
  boolean moved = false;           


  if (!ultimoMostro) {
    int playerTargetX = playerX; 
    int playerTargetY = playerY;

    
    if (playerTargetY < m.y) { // Player è SOPRA
      if (playerTargetX < m.x) { // Player è SOPRA-SINISTRA
        
        if ((percorso[m.y][m.x] & (1 << 0)) != 0 && !visitato[m.y-1][m.x]) { m.y--; m.ultimaMossa = 0; moved = true; } // SU
        else if ((percorso[m.y][m.x] & (1 << 3)) != 0 && !visitato[m.y][m.x-1]) { m.x--; m.ultimaMossa = 3; moved = true; } // SINISTRA
        else if ((percorso[m.y][m.x] & (1 << 2)) != 0 && !visitato[m.y][m.x+1]) { m.x++; m.ultimaMossa = 2; moved = true; } // DESTRA (fallback)
        else if ((percorso[m.y][m.x] & (1 << 1)) != 0 && !visitato[m.y+1][m.x]) { m.y++; m.ultimaMossa = 1; moved = true; } // GIÙ (fallback)
      } else if (playerTargetX > m.x) { // Player è SOPRA-DESTRA

        if ((percorso[m.y][m.x] & (1 << 0)) != 0 && !visitato[m.y-1][m.x]) { m.y--; m.ultimaMossa = 0; moved = true; } // SU
        else if ((percorso[m.y][m.x] & (1 << 2)) != 0 && !visitato[m.y][m.x+1]) { m.x++; m.ultimaMossa = 2; moved = true; } // DESTRA
        else if ((percorso[m.y][m.x] & (1 << 3)) != 0 && !visitato[m.y][m.x-1]) { m.x--; m.ultimaMossa = 3; moved = true; } // SINISTRA (fallback)
        else if ((percorso[m.y][m.x] & (1 << 1)) != 0 && !visitato[m.y+1][m.x]) { m.y++; m.ultimaMossa = 1; moved = true; } // GIÙ (fallback)
      } else { // Player è DRITTO SOPRA (playerTargetX == m.x)
        
        if ((percorso[m.y][m.x] & (1 << 0)) != 0 && !visitato[m.y-1][m.x]) { m.y--; m.ultimaMossa = 0; moved = true; } // SU
        else if ((percorso[m.y][m.x] & (1 << 3)) != 0 && !visitato[m.y][m.x-1]) { m.x--; m.ultimaMossa = 3; moved = true; } // SINISTRA (fallback)
        else if ((percorso[m.y][m.x] & (1 << 2)) != 0 && !visitato[m.y][m.x+1]) { m.x++; m.ultimaMossa = 2; moved = true; } // DESTRA (fallback)
        else if ((percorso[m.y][m.x] & (1 << 1)) != 0 && !visitato[m.y+1][m.x]) { m.y++; m.ultimaMossa = 1; moved = true; } // GIÙ (fallback)
      }
    } else if (playerTargetY == m.y) { // Player è sulla STESSA RIGA
      if (playerTargetX < m.x) { // Player è a SINISTRA
        
        if ((percorso[m.y][m.x] & (1 << 3)) != 0 && !visitato[m.y][m.x-1]) { m.x--; m.ultimaMossa = 3; moved = true; } // SINISTRA
        else if ((percorso[m.y][m.x] & (1 << 0)) != 0 && !visitato[m.y-1][m.x]) { m.y--; m.ultimaMossa = 0; moved = true; } // SU (fallback)
        else if ((percorso[m.y][m.x] & (1 << 1)) != 0 && !visitato[m.y+1][m.x]) { m.y++; m.ultimaMossa = 1; moved = true; } // GIÙ (fallback)
        else if ((percorso[m.y][m.x] & (1 << 2)) != 0 && !visitato[m.y][m.x+1]) { m.x++; m.ultimaMossa = 2; moved = true; } // DESTRA (fallback)
      } else if (playerTargetX > m.x) { // Player è a DESTRA
        
        if ((percorso[m.y][m.x] & (1 << 2)) != 0 && !visitato[m.y][m.x+1]) { m.x++; m.ultimaMossa = 2; moved = true; } // DESTRA
        else if ((percorso[m.y][m.x] & (1 << 0)) != 0 && !visitato[m.y-1][m.x]) { m.y--; m.ultimaMossa = 0; moved = true; } // SU (fallback)
        else if ((percorso[m.y][m.x] & (1 << 1)) != 0 && !visitato[m.y+1][m.x]) { m.y++; m.ultimaMossa = 1; moved = true; } // GIÙ (fallback)
        else if ((percorso[m.y][m.x] & (1 << 3)) != 0 && !visitato[m.y][m.x-1]) { m.x--; m.ultimaMossa = 3; moved = true; } // SINISTRA (fallback)
      }
      
    } else { // Player è SOTTO (playerTargetY > m.y)
      if (playerTargetX < m.x) { // Player è SOTTO-SINISTRA
        
        if ((percorso[m.y][m.x] & (1 << 1)) != 0 && !visitato[m.y+1][m.x]) { m.y++; m.ultimaMossa = 1; moved = true; } // GIÙ
        else if ((percorso[m.y][m.x] & (1 << 3)) != 0 && !visitato[m.y][m.x-1]) { m.x--; m.ultimaMossa = 3; moved = true; } // SINISTRA
        else if ((percorso[m.y][m.x] & (1 << 2)) != 0 && !visitato[m.y][m.x+1]) { m.x++; m.ultimaMossa = 2; moved = true; } // DESTRA (fallback)
        else if ((percorso[m.y][m.x] & (1 << 0)) != 0 && !visitato[m.y-1][m.x]) { m.y--; m.ultimaMossa = 0; moved = true; } // SU (fallback)
      } else if (playerTargetX > m.x) { // Player è SOTTO-DESTRA
        
        if ((percorso[m.y][m.x] & (1 << 1)) != 0 && !visitato[m.y+1][m.x]) { m.y++; m.ultimaMossa = 1; moved = true; } // GIÙ
        else if ((percorso[m.y][m.x] & (1 << 2)) != 0 && !visitato[m.y][m.x+1]) { m.x++; m.ultimaMossa = 2; moved = true; } // DESTRA
        else if ((percorso[m.y][m.x] & (1 << 3)) != 0 && !visitato[m.y][m.x-1]) { m.x--; m.ultimaMossa = 3; moved = true; } // SINISTRA (fallback)
        else if ((percorso[m.y][m.x] & (1 << 0)) != 0 && !visitato[m.y-1][m.x]) { m.y--; m.ultimaMossa = 0; moved = true; } // SU (fallback)
      } else { // Player è DRITTO SOTTO (playerTargetX == m.x)
        
        if ((percorso[m.y][m.x] & (1 << 1)) != 0 && !visitato[m.y+1][m.x]) { m.y++; m.ultimaMossa = 1; moved = true; } // GIÙ
        else if ((percorso[m.y][m.x] & (1 << 3)) != 0 && !visitato[m.y][m.x-1]) { m.x--; m.ultimaMossa = 3; moved = true; } // SINISTRA (fallback)
        else if ((percorso[m.y][m.x] & (1 << 2)) != 0 && !visitato[m.y][m.x+1]) { m.x++; m.ultimaMossa = 2; moved = true; } // DESTRA (fallback)
        else if ((percorso[m.y][m.x] & (1 << 0)) != 0 && !visitato[m.y-1][m.x]) { m.y--; m.ultimaMossa = 0; moved = true; } // SU (fallback)
      }
    }

  } 
  
  else { 
    if ((percorso[m.y][m.x] & (1 << 0)) != 0 && !visitato[m.y-1][m.x]) {
      m.y--; m.ultimaMossa = 0; moved = true;
    } else if ((percorso[m.y][m.x] & (1 << 3)) != 0 && !visitato[m.y][m.x-1]) {
      m.x--; m.ultimaMossa = 3; moved = true;
    } else if ((percorso[m.y][m.x] & (1 << 2)) != 0 && !visitato[m.y][m.x+1]) {
      m.x++; m.ultimaMossa = 2; moved = true;
    } else if ((percorso[m.y][m.x] & (1 << 1)) != 0 && !visitato[m.y+1][m.x]) {
      m.y++; m.ultimaMossa = 1; moved = true;
    }
  }

  // Se ci siamo mossi, segna la nuova cella e incrementa il contatore
  if (moved) {
    visitato[m.y][m.x] = true;
    m.nMosse++;
  } 
  
  else {
    m.stato = 2; // Diventa spettro se bloccato
    // nMosse e spettro=true verranno gestiti nello switch di mobIA
  }
}

void fygarGreedy(Fygar m) {
  boolean moved = false;
  // Se non è l ultimo mostro, segue logica greedy verso il player
  if (!ultimoMostro) {
    int playerTargetX = playerX;
    int playerTargetY = playerY;

    // Logica di movimento migliorata (identica a pookaGreedy)
    if (playerTargetY < m.y) { // Player è SOPRA
      if (playerTargetX < m.x) { // Player è SOPRA-SINISTRA
        if ((percorso[m.y][m.x] & (1 << 0)) != 0 && !visitato[m.y-1][m.x]) { m.y--; m.ultimaMossa = 0; moved = true; }
        else if ((percorso[m.y][m.x] & (1 << 3)) != 0 && !visitato[m.y][m.x-1]) { m.x--; m.ultimaMossa = 3; moved = true; }
        else if ((percorso[m.y][m.x] & (1 << 2)) != 0 && !visitato[m.y][m.x+1]) { m.x++; m.ultimaMossa = 2; moved = true; }
        else if ((percorso[m.y][m.x] & (1 << 1)) != 0 && !visitato[m.y+1][m.x]) { m.y++; m.ultimaMossa = 1; moved = true; }
      } else if (playerTargetX > m.x) { // Player è SOPRA-DESTRA
        if ((percorso[m.y][m.x] & (1 << 0)) != 0 && !visitato[m.y-1][m.x]) { m.y--; m.ultimaMossa = 0; moved = true; }
        else if ((percorso[m.y][m.x] & (1 << 2)) != 0 && !visitato[m.y][m.x+1]) { m.x++; m.ultimaMossa = 2; moved = true; }
        else if ((percorso[m.y][m.x] & (1 << 3)) != 0 && !visitato[m.y][m.x-1]) { m.x--; m.ultimaMossa = 3; moved = true; }
        else if ((percorso[m.y][m.x] & (1 << 1)) != 0 && !visitato[m.y+1][m.x]) { m.y++; m.ultimaMossa = 1; moved = true; }
      } else { // Player è DRITTO SOPRA
        if ((percorso[m.y][m.x] & (1 << 0)) != 0 && !visitato[m.y-1][m.x]) { m.y--; m.ultimaMossa = 0; moved = true; }
        else if ((percorso[m.y][m.x] & (1 << 3)) != 0 && !visitato[m.y][m.x-1]) { m.x--; m.ultimaMossa = 3; moved = true; }
        else if ((percorso[m.y][m.x] & (1 << 2)) != 0 && !visitato[m.y][m.x+1]) { m.x++; m.ultimaMossa = 2; moved = true; }
        else if ((percorso[m.y][m.x] & (1 << 1)) != 0 && !visitato[m.y+1][m.x]) { m.y++; m.ultimaMossa = 1; moved = true; }
      }
    } else if (playerTargetY == m.y) { // Player è sulla STESSA RIGA
      if (playerTargetX < m.x) { // Player è a SINISTRA
        if ((percorso[m.y][m.x] & (1 << 3)) != 0 && !visitato[m.y][m.x-1]) { m.x--; m.ultimaMossa = 3; moved = true; }
        else if ((percorso[m.y][m.x] & (1 << 0)) != 0 && !visitato[m.y-1][m.x]) { m.y--; m.ultimaMossa = 0; moved = true; }
        else if ((percorso[m.y][m.x] & (1 << 1)) != 0 && !visitato[m.y+1][m.x]) { m.y++; m.ultimaMossa = 1; moved = true; }
        else if ((percorso[m.y][m.x] & (1 << 2)) != 0 && !visitato[m.y][m.x+1]) { m.x++; m.ultimaMossa = 2; moved = true; }
      } else if (playerTargetX > m.x) { // Player è a DESTRA
        if ((percorso[m.y][m.x] & (1 << 2)) != 0 && !visitato[m.y][m.x+1]) { m.x++; m.ultimaMossa = 2; moved = true; }
        else if ((percorso[m.y][m.x] & (1 << 0)) != 0 && !visitato[m.y-1][m.x]) { m.y--; m.ultimaMossa = 0; moved = true; }
        else if ((percorso[m.y][m.x] & (1 << 1)) != 0 && !visitato[m.y+1][m.x]) { m.y++; m.ultimaMossa = 1; moved = true; }
        else if ((percorso[m.y][m.x] & (1 << 3)) != 0 && !visitato[m.y][m.x-1]) { m.x--; m.ultimaMossa = 3; moved = true; }
      }
    } else { // Player è SOTTO
      if (playerTargetX < m.x) { // Player è SOTTO-SINISTRA
        if ((percorso[m.y][m.x] & (1 << 1)) != 0 && !visitato[m.y+1][m.x]) { m.y++; m.ultimaMossa = 1; moved = true; }
        else if ((percorso[m.y][m.x] & (1 << 3)) != 0 && !visitato[m.y][m.x-1]) { m.x--; m.ultimaMossa = 3; moved = true; }
        else if ((percorso[m.y][m.x] & (1 << 2)) != 0 && !visitato[m.y][m.x+1]) { m.x++; m.ultimaMossa = 2; moved = true; }
        else if ((percorso[m.y][m.x] & (1 << 0)) != 0 && !visitato[m.y-1][m.x]) { m.y--; m.ultimaMossa = 0; moved = true; }
      } else if (playerTargetX > m.x) { // Player è SOTTO-DESTRA
        if ((percorso[m.y][m.x] & (1 << 1)) != 0 && !visitato[m.y+1][m.x]) { m.y++; m.ultimaMossa = 1; moved = true; }
        else if ((percorso[m.y][m.x] & (1 << 2)) != 0 && !visitato[m.y][m.x+1]) { m.x++; m.ultimaMossa = 2; moved = true; }
        else if ((percorso[m.y][m.x] & (1 << 3)) != 0 && !visitato[m.y][m.x-1]) { m.x--; m.ultimaMossa = 3; moved = true; }
        else if ((percorso[m.y][m.x] & (1 << 0)) != 0 && !visitato[m.y-1][m.x]) { m.y--; m.ultimaMossa = 0; moved = true; }
      } else { // Player è DRITTO SOTTO
        if ((percorso[m.y][m.x] & (1 << 1)) != 0 && !visitato[m.y+1][m.x]) { m.y++; m.ultimaMossa = 1; moved = true; }
        else if ((percorso[m.y][m.x] & (1 << 3)) != 0 && !visitato[m.y][m.x-1]) { m.x--; m.ultimaMossa = 3; moved = true; }
        else if ((percorso[m.y][m.x] & (1 << 2)) != 0 && !visitato[m.y][m.x+1]) { m.x++; m.ultimaMossa = 2; moved = true; }
        else if ((percorso[m.y][m.x] & (1 << 0)) != 0 && !visitato[m.y-1][m.x]) { m.y--; m.ultimaMossa = 0; moved = true; }
      }
    }
  } else { 
    if ((percorso[m.y][m.x] & (1 << 0)) != 0 && !visitato[m.y-1][m.x]) {
      m.y--; m.ultimaMossa = 0; moved = true;
    } else if ((percorso[m.y][m.x] & (1 << 3)) != 0 && !visitato[m.y][m.x-1]) {
      m.x--; m.ultimaMossa = 3; moved = true;
    } else if ((percorso[m.y][m.x] & (1 << 2)) != 0 && !visitato[m.y][m.x+1]) {
      m.x++; m.ultimaMossa = 2; moved = true;
    } else if ((percorso[m.y][m.x] & (1 << 1)) != 0 && !visitato[m.y+1][m.x]) {
      m.y++; m.ultimaMossa = 1; moved = true;
    }
  }

  if (moved) {
    visitato[m.y][m.x] = true;
    m.nMosse++;
  } else {
    m.stato = 2; // Diventa spettro se bloccato
    // nMosse e spettro=true verranno gestiti nello switch di mobIA
  }
}


void moveSpettroPooka(Pooka m) {

  int targetX = ultimoMostro ? 0 : playerX;
  int targetY = ultimoMostro ? 0 : playerY;

  int dx = (targetX > m.x) ? 1 : (targetX < m.x ? -1 : 0);
  int dy = (targetY > m.y) ? 1 : (targetY < m.y ? -1 : 0);

  
  m.x += dx;
  m.y += dy;

  
  if      (dx ==  0 && dy == -1) m.ultimaMossa = 0;
  else if (dx ==  0 && dy ==  1) m.ultimaMossa = 1;
  else if (dx ==  1 && dy ==  0) m.ultimaMossa = 2;
  else if (dx == -1 && dy ==  0) m.ultimaMossa = 3;
  else if (dx ==  1 && dy == -1) m.ultimaMossa = 4;
  else if (dx == -1 && dy == -1) m.ultimaMossa = 5;
  else if (dx ==  1 && dy ==  1) m.ultimaMossa = 6;
  else if (dx == -1 && dy ==  1) m.ultimaMossa = 7;


  m.nMosse++;
  
  
  if (m.nMosse >= 2 && mappa[m.y][m.x] != 65535) { 

    m.stato = ultimoMostro ? 3 : 1;
    m.spettro = false;
    m.nMosse = 0; 
  }
}


void moveSpettroFygar(Fygar m) {
  int targetX = ultimoMostro ? 0 : playerX;
  int targetY = ultimoMostro ? 0 : playerY;
  int dx      = (targetX > m.x) ? 1 : (targetX < m.x ? -1 : 0);
  int dy      = (targetY > m.y) ? 1 : (targetY < m.y ? -1 : 0);

  m.x += dx;
  m.y += dy;

  if      (dx ==  0 && dy == -1) m.ultimaMossa = 0;
  else if (dx ==  0 && dy ==  1) m.ultimaMossa = 1;
  else if (dx ==  1 && dy ==  0) m.ultimaMossa = 2;
  else if (dx == -1 && dy ==  0) m.ultimaMossa = 3;
  else if (dx ==  1 && dy == -1) m.ultimaMossa = 4;
  else if (dx == -1 && dy == -1) m.ultimaMossa = 5;
  else if (dx ==  1 && dy ==  1) m.ultimaMossa = 6;
  else if (dx == -1 && dy ==  1) m.ultimaMossa = 7;

  m.nMosse++;
  m.spettro = true; 

  
  if (m.nMosse >= 20 && mappa[m.y][m.x] != 65535) { 
    m.stato     = ultimoMostro ? 3 : 1;
    m.spettro = false;
    m.nMosse    = 0; 
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
} */
