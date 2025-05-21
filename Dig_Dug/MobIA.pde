void mobIA(){
  convertiMatrice();
  
  for (Pooka p : pooka) {
    
    if(ultimoMostro){
      p.stato=3;
    }
    
    if(!p.spettro){
      p.stato = (!ultimoMostro) ? 1 : 3;
    }
  
  if(p.tempoMorte==-1 && !p.isPookaSchiacciato && !p.isGrabbed && p.gonfiore==0){  
    switch(p.stato){
      case 0:
      case 1:
        if(clock%40==0){
          pookaGreedy(p);
          if(p.nMosse>50){
            p.nMosse=0;
            p.stato=2;
          }
        }
        break;
      case 2:
        p.spettro=true;
        break;
      case 3:
        if(clock%40==0){
          pookaGreedy(p);
          if(p.nMosse>30){
            p.nMosse=0;
            p.stato=2;
          }
        }
        break;
    }
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
    
    switch(f.stato){
      case 0:
      
      break;
    }
  }
}

void pookaGreedy(Pooka m) {
  if(!ultimoMostro){
    
    if (playerY < m.y) {           // Player sopra
        if (playerX < m.x) {
            
          if ((percorso[m.y][m.x] & (1 << 0)) != 0 && m.ultimaMossa !=1) {
            m.y--;
            m.ultimaMossa=0;
          } else if ((percorso[m.y][m.x] & (1 << 3)) != 0 && m.ultimaMossa !=2) {
            m.x--;
            m.ultimaMossa=3;
          } else if ((percorso[m.y][m.x] & (1 << 2)) != 0 && m.ultimaMossa !=3) {
            m.x++;
            m.ultimaMossa=2;
          } else if((percorso[m.y][m.x] & (1 << 1)) != 0 && m.ultimaMossa !=0)  {
            m.y++;
            m.ultimaMossa=1;
          }
        
        }
        else if (playerX == m.x) {
        
          if ((percorso[m.y][m.x] & (1 << 0)) != 0 && m.ultimaMossa !=1) {
            m.y--;
            m.ultimaMossa=0;
          } else if ((percorso[m.y][m.x] & (1 << 3)) != 0 && m.ultimaMossa !=2) {
            m.x--;
            m.ultimaMossa=3;
          } else if ((percorso[m.y][m.x] & (1 << 2)) != 0 && m.ultimaMossa !=3) {
            m.x++;
            m.ultimaMossa=2;
          } else if((percorso[m.y][m.x] & (1 << 1)) != 0 && m.ultimaMossa !=0)  {
            m.y++;
            m.ultimaMossa=1;
          }
          
        }
        else { // playerX > m.x
            
          if ((percorso[m.y][m.x] & (1 << 0)) != 0 && m.ultimaMossa !=1) {
            m.y--;
            m.ultimaMossa=0;
          } else if ((percorso[m.y][m.x] & (1 << 2)) != 0 && m.ultimaMossa !=3) {
            m.x++;
            m.ultimaMossa=2;
          } else if ((percorso[m.y][m.x] & (1 << 3)) != 0 && m.ultimaMossa !=2) {
            m.x--;
            m.ultimaMossa=3;
          } else if((percorso[m.y][m.x] & (1 << 1)) != 0 && m.ultimaMossa !=0)  {
            m.y++;
            m.ultimaMossa=1;
          }
          
        }
        
    }
    else if (playerY == m.y) {   // stessa riga
        if (playerX < m.x) {
            
          if ((percorso[m.y][m.x] & (1 << 3)) != 0 && m.ultimaMossa !=2) {
            m.x--;
            m.ultimaMossa=3;
          } else if ((percorso[m.y][m.x] & (1 << 0)) != 0 && m.ultimaMossa !=1) {
            m.y--;
            m.ultimaMossa=0;
          } else if ((percorso[m.y][m.x] & (1 << 1)) != 0 && m.ultimaMossa !=0) {
            m.y++;
            m.ultimaMossa=1;
          } else if((percorso[m.y][m.x] & (1 << 2)) != 0 && m.ultimaMossa !=3)  {
            m.x++;
            m.ultimaMossa=2;
          }  
          
        }
        else if (playerX > m.x) {
            
          if ((percorso[m.y][m.x] & (1 << 2)) != 0 && m.ultimaMossa !=3) {
            m.x++;
            m.ultimaMossa=2;
          } else if ((percorso[m.y][m.x] & (1 << 0)) != 0 && m.ultimaMossa !=1) {
            m.y--;
            m.ultimaMossa=0;
          } else if ((percorso[m.y][m.x] & (1 << 1)) != 0 && m.ultimaMossa !=0) {
            m.y++;
            m.ultimaMossa=1;
          } else if((percorso[m.y][m.x] & (1 << 3)) != 0 && m.ultimaMossa !=3)  {
            m.x--;
            m.ultimaMossa=2;
          }    
          
        }
    }
    else {                       // playerY > m.y  player sotto
        if (playerX < m.x) {
            
          if ((percorso[m.y][m.x] & (1 << 1)) != 0 && m.ultimaMossa !=0) {
            m.y++;
            m.ultimaMossa=1;
          } else if ((percorso[m.y][m.x] & (1 << 3)) != 0 && m.ultimaMossa !=2) {
            m.x--;
            m.ultimaMossa=3;
          } else if ((percorso[m.y][m.x] & (1 << 2)) != 0 && m.ultimaMossa !=3) {
            m.x++;
            m.ultimaMossa=2;
          } else if((percorso[m.y][m.x] & (1 << 0)) != 0 && m.ultimaMossa !=1)  {
            m.y--;
            m.ultimaMossa=0;
          }  
          
        }
        else if (playerX == m.x) {
            
          if ((percorso[m.y][m.x] & (1 << 1)) != 0 && m.ultimaMossa !=0) {
            m.y++;
            m.ultimaMossa=1;
          } else if ((percorso[m.y][m.x] & (1 << 3)) != 0 && m.ultimaMossa !=2) {
            m.x--;
            m.ultimaMossa=3;
          } else if ((percorso[m.y][m.x] & (1 << 2)) != 0 && m.ultimaMossa !=3) {
            m.x++;
            m.ultimaMossa=2;
          } else if((percorso[m.y][m.x] & (1 << 0)) != 0 && m.ultimaMossa !=1)  {
            m.y--;
            m.ultimaMossa=0;
          } 
          
        }
        else { // playerX > m.x
            
            if ((percorso[m.y][m.x] & (1 << 1)) != 0 && m.ultimaMossa !=0) {
            m.y++;
            m.ultimaMossa=1;
          } else if ((percorso[m.y][m.x] & (1 << 2)) != 0 && m.ultimaMossa !=3) {
            m.x++;
            m.ultimaMossa=2;
          } else if ((percorso[m.y][m.x] & (1 << 3)) != 0 && m.ultimaMossa !=2) {
            m.x--;
            m.ultimaMossa=3;
          } else if((percorso[m.y][m.x] & (1 << 0)) != 0 && m.ultimaMossa !=1)  {
            m.y--;
            m.ultimaMossa=0;
          } 
            
        }
    }
    
    m.nMosse++;
  }
  else{
    println("mossa del ultimo:");
    
    if ((percorso[m.y][m.x] & (1 << 0)) != 0 && m.ultimaMossa != 1) {
      println("su");
      m.y--;
      m.ultimaMossa=0;
    } else if ((percorso[m.y][m.x] & (1 << 3)) != 0 && m.ultimaMossa != 2) {
      println("sinistra");
      m.x--;
      m.ultimaMossa=3;
    } else if ((percorso[m.y][m.x] & (1 << 2)) != 0 && m.ultimaMossa != 3) {
      println("destra");
      m.x++;
      m.ultimaMossa=2;
    } else if((percorso[m.y][m.x] & (1 << 1)) != 0 && m.ultimaMossa != 0)  {
      println("giu");
      m.y++;
      m.ultimaMossa=1;
    }
    
    m.nMosse++;
  }
}


void convertiMatrice() {
  for (int y = 0; y < 13; y++) {
    for (int x = 0; x < 12; x++) {
      int val = 0;

      if(y>0){
        // primo bit percorso: controlla bit 13 e 14 a 0 della casella accanto e bit 1 e 2 della casella attuale
        if (((mappa[y-1][x] & (1 << 13)) == 0) && ((mappa[y-1][x] & (1 << 14)) == 0) && ((mappa[y][x] & (1 << 1)) == 0) && ((mappa[y][x] & (1 << 2)) == 0)) {
          val |= 1 << 0; // primo bit percorso acceso
        }
      }

      if(y<12){
        // primo bit percorso: controlla bit 1 e 2 a 0 della casella accanto e bit 13 e 14 della casella attuale
        if (((mappa[y+1][x] & (1 << 1)) == 0) && ((mappa[y+1][x] & (1 << 2)) == 0) && ((mappa[y][x] & (1 << 13)) == 0) && ((mappa[y][x] & (1 << 14)) == 0)) {
          val |= 1 << 1; // secondo bit percorso acceso
        }
      }
  
      if(x<11){
        // terzo bit percorso: controlla bit 4 e 8 a 0 della casella accanto e bit 7 e 11 della casella attuale
        if (((mappa[y][x+1] & (1 << 4)) == 0) && ((mappa[y][x+1] & (1 << 8)) == 0) && ((mappa[y][x] & (1 << 7)) == 0) && ((mappa[y][x] & (1 << 11)) == 0)) {
          val |= 1 << 2; // terzo bit percorso acceso
        }
      }

      if(x>0){
        // quarto bit percorso: controlla bit 7 e 11 a 0 della casella accanto e bit 4 e 8 della casella attuale
        if (((mappa[y][x-1] & (1 << 7)) == 0) && ((mappa[y][x-1] & (1 << 11)) == 0) && ((mappa[y][x] & (1 << 4)) == 0) && ((mappa[y][x] & (1 << 8)) == 0)) {
          val |= 1 << 3; // quarto bit percorso acceso
        }
      }

      percorso[y][x] = val;
    }
  }
}
