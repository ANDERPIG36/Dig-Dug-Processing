void mobIA(){
  convertiMatrice();
  
  for (Pooka p : pooka) {
  
    if(playerX >= p.x - 2 && playerX <= p.x + 2 && playerY >= p.y - 2 && playerY <= p.y + 2 && p.gonfiore<=0 && !p.spettro && !p.isGrabbed && !ultimoMostro && p.stato!=2){
      p.stato=1;
    }
    else if(p.gonfiore<=0 && !p.spettro && !p.isGrabbed && !ultimoMostro && p.stato!=2){
      p.stato=0;
    }
    
    if(ultimoMostro && !p.spettro && p.stato!=2){
      p.stato=3;
    }
    
    if(p.tempoMorte==-1 && !p.isPookaSchiacciato && !p.isGrabbed && p.gonfiore==0){  
      switch(p.stato){
        case 0:
          if(clock%10==0){
            pookaGreedy(p);
            if(p.nMosse>60){
              p.nMosse=0;
              p.stato=2;
            }
          }
          break;
        case 1:
          if(clock%10==0){
            pookaGreedy(p);
          }
          break;
        case 2:
          p.spettro=true;
          if(clock%25==0){
            pookaMoveSpettro(p);
          }
          if(((mappa[p.y][p.x] >> 5) & 1) == 0 && ((mappa[p.y][p.x] >> 6) & 1) == 0 && ((mappa[p.y][p.x] >> 9) & 1) == 0 && ((mappa[p.y][p.x] >> 10) & 1) == 0 && p.nMosse>12){
            p.spettro=false;
            p.subX=1;
            p.subY=3;
            p.stato = 0;
            p.nMosse = 0;
          }
          break;
        case 3:
          if(clock%10==0){
            if(!p.passatoDalVia){
              pookaGreedy(p);
            }
            else{
              fugaFinalePooka(p);
            }
          }
          break;
      }
    }
    
  }
  
  for (Fygar f : fygar) {
    
    if(playerX >= f.x - 2 && playerX <= f.x + 2 && playerY >= f.y - 2 && playerY <= f.y + 2 && f.gonfiore<=0 && !f.spettro && !f.isGrabbed && !ultimoMostro && f.stato!=4 && f.stato!=2){
      f.stato=1;
    }
    else if(f.gonfiore<=0 && !f.spettro && !f.isGrabbed && !ultimoMostro && f.stato!=4 && f.stato!=2){
      f.stato=0;
    }
    
    if(ultimoMostro && !f.spettro && f.stato!=4 && f.stato!=2){
      f.stato=3;
    }
    
    controlloAttaccoFygar(f);
    
    attaccoFygar(f);
    
    if(f.tempoMorte==-1 && !f.isFygarSchiacciato && !f.isGrabbed && f.gonfiore==0){  
      switch(f.stato){
        case 0:
          if(clock%10==0){
            fygarGreedy(f);
            if(f.nMosse>60){
              f.nMosse=0;
              f.stato=2;
            }
          }
          break;
        case 1:
          if(clock%10==0){
            fygarGreedy(f);
          }
          break;
        case 2:
          f.spettro=true;
          if(clock%25==0){
            fygarMoveSpettro(f);
          }
          if(((mappa[f.y][f.x] >> 5) & 1) == 0 && ((mappa[f.y][f.x] >> 6) & 1) == 0 && ((mappa[f.y][f.x] >> 9) & 1) == 0 && ((mappa[f.y][f.x] >> 10) & 1) == 0 && f.nMosse>12){
            f.spettro=false;
            f.subX=1;
            f.subY=3;
            f.stato = 0;
            f.nMosse = 0;
          }
          break;
        case 3:
          if(clock%10==0){
            if(!f.passatoDalVia){
              fygarGreedy(f);
            }
            else{
              fugaFinaleFygar(f);
            }
          }
          break;
      }
    }
  }
}

void pookaGreedy(Pooka m) {
  int ricercaY = ultimoMostro ? 6 : playerY;
  int ricercaX = ultimoMostro ? 5 : playerX;
    
  if (ricercaY < m.y) {           // Player sopra
      if (ricercaX < m.x) {
          
        if ((percorso[m.y][m.x] & (1 << 0)) != 0 && m.ultimaMossa !=1 && m.ultimoArrivo!=1) {
          m.subY--;
          m.ultimaMossa=0;
        } else if ((percorso[m.y][m.x] & (1 << 3)) != 0 && m.ultimaMossa !=2  && m.ultimoArrivo!=2) {
          m.subX--;
          m.ultimaMossa=3;
        } else if ((percorso[m.y][m.x] & (1 << 2)) != 0 && m.ultimaMossa !=3  && m.ultimoArrivo!=3) {
          m.subX++;
          m.ultimaMossa=2;
        } else if((percorso[m.y][m.x] & (1 << 1)) != 0 && m.ultimaMossa !=0 && m.ultimoArrivo!=3)  {
          m.subY++;
          m.ultimaMossa=1;
        } else {
        
          m.ultimoArrivo=-1;
          switch(m.ultimaMossa){
            case 0:
              m.subY++;
              m.ultimaMossa=1;
              break;
            case 1:
              m.subY--;
              m.ultimaMossa=0;
              break;
            case 2:
              m.subX--;
              m.ultimaMossa=3;
              break;
            case 3:
              m.subX++;
              m.ultimaMossa=2;
              break;
          }
          
        }
      
      }
      else if (ricercaX == m.x) {
      
        if ((percorso[m.y][m.x] & (1 << 0)) != 0 && m.ultimaMossa !=1 && m.ultimoArrivo!=1) {
          m.subY--;
          m.ultimaMossa=0;
        } else if ((percorso[m.y][m.x] & (1 << 3)) != 0 && m.ultimaMossa !=2 && m.ultimoArrivo!=2) {
          m.subX--;
          m.ultimaMossa=3;
        } else if ((percorso[m.y][m.x] & (1 << 2)) != 0 && m.ultimaMossa !=3 && m.ultimoArrivo!=3) {
          m.subX++;
          m.ultimaMossa=2;
        } else if((percorso[m.y][m.x] & (1 << 1)) != 0 && m.ultimaMossa !=0 && m.ultimoArrivo!=4)  {
          m.subY++;
          m.ultimaMossa=1;
        } else {
        
          m.ultimoArrivo=-1;
          switch(m.ultimaMossa){
            case 0:
              m.subY++;
              m.ultimaMossa=1;
              break;
            case 1:
              m.subY--;
              m.ultimaMossa=0;
              break;
            case 2:
              m.subX--;
              m.ultimaMossa=3;
              break;
            case 3:
              m.subX++;
              m.ultimaMossa=2;
              break;
          }
          
        }
        
      }
      else { // playerX > m.x
          
        if ((percorso[m.y][m.x] & (1 << 0)) != 0 && m.ultimaMossa !=1 && m.ultimoArrivo!=1) {
          m.subY--;
          m.ultimaMossa=0;
        } else if ((percorso[m.y][m.x] & (1 << 2)) != 0 && m.ultimaMossa !=3 && m.ultimoArrivo!=3) {
          m.subX++;
          m.ultimaMossa=2;
        } else if ((percorso[m.y][m.x] & (1 << 3)) != 0 && m.ultimaMossa !=2 && m.ultimoArrivo!=2) {
          m.subX--;
          m.ultimaMossa=3;
        } else if((percorso[m.y][m.x] & (1 << 1)) != 0 && m.ultimaMossa !=0 && m.ultimoArrivo!=0)  {
          m.subY++;
          m.ultimaMossa=1;
        } else {
        
          m.ultimoArrivo=-1;
          switch(m.ultimaMossa){
            case 0:
              m.subY++;
              m.ultimaMossa=1;
              break;
            case 1:
              m.subY--;
              m.ultimaMossa=0;
              break;
            case 2:
              m.subX--;
              m.ultimaMossa=3;
              break;
            case 3:
              m.subX++;
              m.ultimaMossa=2;
              break;
          }
          
        }
        
      }
      
  }
  else if (ricercaY == m.y) {   // stessa riga
      if (ricercaX < m.x) {
          
        if ((percorso[m.y][m.x] & (1 << 3)) != 0 && m.ultimaMossa !=2 && m.ultimoArrivo!=2) {
          m.subX--;
          m.ultimaMossa=3;
        } else if ((percorso[m.y][m.x] & (1 << 0)) != 0 && m.ultimaMossa !=1 && m.ultimoArrivo!=1) {
          m.subY--;
          m.ultimaMossa=0;
        } else if ((percorso[m.y][m.x] & (1 << 1)) != 0 && m.ultimaMossa !=0 && m.ultimoArrivo!=0) {
          m.subY++;
          m.ultimaMossa=1;
        } else if((percorso[m.y][m.x] & (1 << 2)) != 0 && m.ultimaMossa !=3 && m.ultimoArrivo!=3)  {
          m.subX++;
          m.ultimaMossa=2;
        } else {
        
          m.ultimoArrivo=-1;
          switch(m.ultimaMossa){
            case 0:
              m.subY++;
              m.ultimaMossa=1;
              break;
            case 1:
              m.subY--;
              m.ultimaMossa=0;
              break;
            case 2:
              m.subX--;
              m.ultimaMossa=3;
              break;
            case 3:
              m.subX++;
              m.ultimaMossa=2;
              break;
          }
          
        }
        
      }
      else if (ricercaX > m.x) {
          
        if ((percorso[m.y][m.x] & (1 << 2)) != 0 && m.ultimaMossa !=3 && m.ultimoArrivo!=3) {
          m.subX++;
          m.ultimaMossa=2;
        } else if ((percorso[m.y][m.x] & (1 << 0)) != 0 && m.ultimaMossa !=1 && m.ultimoArrivo!=1) {
          m.subY--;
          m.ultimaMossa=0;
        } else if ((percorso[m.y][m.x] & (1 << 1)) != 0 && m.ultimaMossa !=0 && m.ultimoArrivo!=0) {
          m.subY++;
          m.ultimaMossa=1;
        } else if((percorso[m.y][m.x] & (1 << 3)) != 0 && m.ultimaMossa !=2 && m.ultimoArrivo!=2)  {
          m.subX--;
          m.ultimaMossa=3;
        } else {
        
          m.ultimoArrivo=-1;
          switch(m.ultimaMossa){
            case 0:
              m.subY++;
              m.ultimaMossa=1;
              break;
            case 1:
              m.subY--;
              m.ultimaMossa=0;
              break;
            case 2:
              m.subX--;
              m.ultimaMossa=3;
              break;
            case 3:
              m.subX++;
              m.ultimaMossa=2;
              break;
          }
          
        }
        
      }
  }
  else {                       // playerY > m.y  player sotto
      if (ricercaX < m.x) {
          
        if ((percorso[m.y][m.x] & (1 << 1)) != 0 && m.ultimaMossa !=0 && m.ultimoArrivo!=0) {
          m.subY++;
          m.ultimaMossa=1;
        } else if ((percorso[m.y][m.x] & (1 << 3)) != 0 && m.ultimaMossa !=2 && m.ultimoArrivo!=2) {
          m.subX--;
          m.ultimaMossa=3;
        } else if ((percorso[m.y][m.x] & (1 << 2)) != 0 && m.ultimaMossa !=3 && m.ultimoArrivo!=3) {
          m.subX++;
          m.ultimaMossa=2;
        } else if((percorso[m.y][m.x] & (1 << 0)) != 0 && m.ultimaMossa !=1 && m.ultimoArrivo!=1)  {
          m.subY--;
          m.ultimaMossa=0;
        } else {
        
          m.ultimoArrivo=-1;
          switch(m.ultimaMossa){
            case 0:
              m.subY++;
              m.ultimaMossa=1;
              break;
            case 1:
              m.subY--;
              m.ultimaMossa=0;
              break;
            case 2:
              m.subX--;
              m.ultimaMossa=3;
              break;
            case 3:
              m.subX++;
              m.ultimaMossa=2;
              break;
          }
          
        }
        
      }
      else if (ricercaX == m.x) {
          
        if ((percorso[m.y][m.x] & (1 << 1)) != 0 && m.ultimaMossa !=0 && m.ultimoArrivo!=0) {
          m.subY++;
          m.ultimaMossa=1;
        } else if ((percorso[m.y][m.x] & (1 << 3)) != 0 && m.ultimaMossa !=2 && m.ultimoArrivo!=2) {
          m.subX--;
          m.ultimaMossa=3;
        } else if ((percorso[m.y][m.x] & (1 << 2)) != 0 && m.ultimaMossa !=3 && m.ultimoArrivo!=3) {
          m.subX++;
          m.ultimaMossa=2;
        } else if((percorso[m.y][m.x] & (1 << 0)) != 0 && m.ultimaMossa !=1 && m.ultimoArrivo!=1)  {
          m.subY--;
          m.ultimaMossa=0;
        } else {
        
          m.ultimoArrivo=-1;
          switch(m.ultimaMossa){
            case 0:
              m.subY++;
              m.ultimaMossa=1;
              break;
            case 1:
              m.subY--;
              m.ultimaMossa=0;
              break;
            case 2:
              m.subX--;
              m.ultimaMossa=3;
              break;
            case 3:
              m.subX++;
              m.ultimaMossa=2;
              break;
          }
          
        }
        
      }
      else { // playerX > m.x
          
          if ((percorso[m.y][m.x] & (1 << 1)) != 0 && m.ultimaMossa !=0 && m.ultimoArrivo!=0) {
          m.subY++;
          m.ultimaMossa=1;
        } else if ((percorso[m.y][m.x] & (1 << 2)) != 0 && m.ultimaMossa !=3 && m.ultimoArrivo!=3) {
          m.subX++;
          m.ultimaMossa=2;
        } else if ((percorso[m.y][m.x] & (1 << 3)) != 0 && m.ultimaMossa !=2 && m.ultimoArrivo!=2) {
          m.subX--;
          m.ultimaMossa=3;
        } else if((percorso[m.y][m.x] & (1 << 0)) != 0 && m.ultimaMossa !=1 && m.ultimoArrivo!=1)  {
          m.subY--;
          m.ultimaMossa=0;
        } else {
        
          m.ultimoArrivo=-1;
          switch(m.ultimaMossa){
            case 0:
              m.subY++;
              m.ultimaMossa=1;
              break;
            case 1:
              m.subY--;
              m.ultimaMossa=0;
              break;
            case 2:
              m.subX--;
              m.ultimaMossa=3;
              break;
            case 3:
              m.subX++;
              m.ultimaMossa=2;
              break;
          }
          
        }
          
      }
  }
  
  m.nMosse++;
  
  if(m.subX>3){
    m.subX-=3;
    m.x++;
    m.ultimoArrivo=2;
  }
  if(m.subX<0){
    m.subX+=3;
    m.x--;
    m.ultimoArrivo=3;
  }
  if(m.subY>3){
    m.subY-=3;
    m.y++;
    m.ultimoArrivo=1;
  }
  if(m.subY<0){
    m.subY+=3;
    m.y--;
    m.ultimoArrivo=0;
  }
  
  //allineamento ai tunnel
  if(m.ultimaMossa==2 || m.ultimaMossa==3){
    m.subY=3;
  }
  if(m.ultimaMossa==0 || m.ultimaMossa==1){
    m.subX=1;
  }
  
  if(m.x==5 && m.y==6 && ultimoMostro){
    m.passatoDalVia=true;
  }
}

void fygarGreedy(Fygar m) {
  int ricercaY = ultimoMostro ? 6 : playerY;
  int ricercaX = ultimoMostro ? 5 : playerX;
    
  if (ricercaY < m.y) {           // Player sopra
      if (ricercaX < m.x) {
          
        if ((percorso[m.y][m.x] & (1 << 0)) != 0 && m.ultimaMossa !=1 && m.ultimoArrivo!=1) {
          m.subY--;
          m.ultimaMossa=0;
        } else if ((percorso[m.y][m.x] & (1 << 3)) != 0 && m.ultimaMossa !=2  && m.ultimoArrivo!=2) {
          m.subX--;
          m.ultimaMossa=3;
        } else if ((percorso[m.y][m.x] & (1 << 2)) != 0 && m.ultimaMossa !=3  && m.ultimoArrivo!=3) {
          m.subX++;
          m.ultimaMossa=2;
        } else if((percorso[m.y][m.x] & (1 << 1)) != 0 && m.ultimaMossa !=0 && m.ultimoArrivo!=3)  {
          m.subY++;
          m.ultimaMossa=1;
        } else {
        
          m.ultimoArrivo=-1;
          switch(m.ultimaMossa){
            case 0:
              m.subY++;
              m.ultimaMossa=1;
              break;
            case 1:
              m.subY--;
              m.ultimaMossa=0;
              break;
            case 2:
              m.subX--;
              m.ultimaMossa=3;
              break;
            case 3:
              m.subX++;
              m.ultimaMossa=2;
              break;
          }
          
        }
      
      }
      else if (ricercaX == m.x) {
      
        if ((percorso[m.y][m.x] & (1 << 0)) != 0 && m.ultimaMossa !=1 && m.ultimoArrivo!=1) {
          m.subY--;
          m.ultimaMossa=0;
        } else if ((percorso[m.y][m.x] & (1 << 3)) != 0 && m.ultimaMossa !=2 && m.ultimoArrivo!=2) {
          m.subX--;
          m.ultimaMossa=3;
        } else if ((percorso[m.y][m.x] & (1 << 2)) != 0 && m.ultimaMossa !=3 && m.ultimoArrivo!=3) {
          m.subX++;
          m.ultimaMossa=2;
        } else if((percorso[m.y][m.x] & (1 << 1)) != 0 && m.ultimaMossa !=0 && m.ultimoArrivo!=4)  {
          m.subY++;
          m.ultimaMossa=1;
        } else {
        
          m.ultimoArrivo=-1;
          switch(m.ultimaMossa){
            case 0:
              m.subY++;
              m.ultimaMossa=1;
              break;
            case 1:
              m.subY--;
              m.ultimaMossa=0;
              break;
            case 2:
              m.subX--;
              m.ultimaMossa=3;
              break;
            case 3:
              m.subX++;
              m.ultimaMossa=2;
              break;
          }
          
        }
        
      }
      else { // playerX > m.x
          
        if ((percorso[m.y][m.x] & (1 << 0)) != 0 && m.ultimaMossa !=1 && m.ultimoArrivo!=1) {
          m.subY--;
          m.ultimaMossa=0;
        } else if ((percorso[m.y][m.x] & (1 << 2)) != 0 && m.ultimaMossa !=3 && m.ultimoArrivo!=3) {
          m.subX++;
          m.ultimaMossa=2;
        } else if ((percorso[m.y][m.x] & (1 << 3)) != 0 && m.ultimaMossa !=2 && m.ultimoArrivo!=2) {
          m.subX--;
          m.ultimaMossa=3;
        } else if((percorso[m.y][m.x] & (1 << 1)) != 0 && m.ultimaMossa !=0 && m.ultimoArrivo!=0)  {
          m.subY++;
          m.ultimaMossa=1;
        } else {
        
          m.ultimoArrivo=-1;
          switch(m.ultimaMossa){
            case 0:
              m.subY++;
              m.ultimaMossa=1;
              break;
            case 1:
              m.subY--;
              m.ultimaMossa=0;
              break;
            case 2:
              m.subX--;
              m.ultimaMossa=3;
              break;
            case 3:
              m.subX++;
              m.ultimaMossa=2;
              break;
          }
          
        }
        
      }
      
  }
  else if (ricercaY == m.y) {   // stessa riga
      if (ricercaX < m.x) {
          
        if ((percorso[m.y][m.x] & (1 << 3)) != 0 && m.ultimaMossa !=2 && m.ultimoArrivo!=2) {
          m.subX--;
          m.ultimaMossa=3;
        } else if ((percorso[m.y][m.x] & (1 << 0)) != 0 && m.ultimaMossa !=1 && m.ultimoArrivo!=1) {
          m.subY--;
          m.ultimaMossa=0;
        } else if ((percorso[m.y][m.x] & (1 << 1)) != 0 && m.ultimaMossa !=0 && m.ultimoArrivo!=0) {
          m.subY++;
          m.ultimaMossa=1;
        } else if((percorso[m.y][m.x] & (1 << 2)) != 0 && m.ultimaMossa !=3 && m.ultimoArrivo!=3)  {
          m.subX++;
          m.ultimaMossa=2;
        } else {
        
          m.ultimoArrivo=-1;
          switch(m.ultimaMossa){
            case 0:
              m.subY++;
              m.ultimaMossa=1;
              break;
            case 1:
              m.subY--;
              m.ultimaMossa=0;
              break;
            case 2:
              m.subX--;
              m.ultimaMossa=3;
              break;
            case 3:
              m.subX++;
              m.ultimaMossa=2;
              break;
          }
          
        }
        
      }
      else if (ricercaX > m.x) {
          
        if ((percorso[m.y][m.x] & (1 << 2)) != 0 && m.ultimaMossa !=3 && m.ultimoArrivo!=3) {
          m.subX++;
          m.ultimaMossa=2;
        } else if ((percorso[m.y][m.x] & (1 << 0)) != 0 && m.ultimaMossa !=1 && m.ultimoArrivo!=1) {
          m.subY--;
          m.ultimaMossa=0;
        } else if ((percorso[m.y][m.x] & (1 << 1)) != 0 && m.ultimaMossa !=0 && m.ultimoArrivo!=0) {
          m.subY++;
          m.ultimaMossa=1;
        } else if((percorso[m.y][m.x] & (1 << 3)) != 0 && m.ultimaMossa !=2 && m.ultimoArrivo!=2)  {
          m.subX--;
          m.ultimaMossa=3;
        } else {
        
          m.ultimoArrivo=-1;
          switch(m.ultimaMossa){
            case 0:
              m.subY++;
              m.ultimaMossa=1;
              break;
            case 1:
              m.subY--;
              m.ultimaMossa=0;
              break;
            case 2:
              m.subX--;
              m.ultimaMossa=3;
              break;
            case 3:
              m.subX++;
              m.ultimaMossa=2;
              break;
          }
          
        }
        
      }
  }
  else {                       // playerY > m.y  player sotto
      if (ricercaX < m.x) {
          
        if ((percorso[m.y][m.x] & (1 << 1)) != 0 && m.ultimaMossa !=0 && m.ultimoArrivo!=0) {
          m.subY++;
          m.ultimaMossa=1;
        } else if ((percorso[m.y][m.x] & (1 << 3)) != 0 && m.ultimaMossa !=2 && m.ultimoArrivo!=2) {
          m.subX--;
          m.ultimaMossa=3;
        } else if ((percorso[m.y][m.x] & (1 << 2)) != 0 && m.ultimaMossa !=3 && m.ultimoArrivo!=3) {
          m.subX++;
          m.ultimaMossa=2;
        } else if((percorso[m.y][m.x] & (1 << 0)) != 0 && m.ultimaMossa !=1 && m.ultimoArrivo!=1)  {
          m.subY--;
          m.ultimaMossa=0;
        } else {
        
          m.ultimoArrivo=-1;
          switch(m.ultimaMossa){
            case 0:
              m.subY++;
              m.ultimaMossa=1;
              break;
            case 1:
              m.subY--;
              m.ultimaMossa=0;
              break;
            case 2:
              m.subX--;
              m.ultimaMossa=3;
              break;
            case 3:
              m.subX++;
              m.ultimaMossa=2;
              break;
          }
          
        }
        
      }
      else if (ricercaX == m.x) {
          
        if ((percorso[m.y][m.x] & (1 << 1)) != 0 && m.ultimaMossa !=0 && m.ultimoArrivo!=0) {
          m.subY++;
          m.ultimaMossa=1;
        } else if ((percorso[m.y][m.x] & (1 << 3)) != 0 && m.ultimaMossa !=2 && m.ultimoArrivo!=2) {
          m.subX--;
          m.ultimaMossa=3;
        } else if ((percorso[m.y][m.x] & (1 << 2)) != 0 && m.ultimaMossa !=3 && m.ultimoArrivo!=3) {
          m.subX++;
          m.ultimaMossa=2;
        } else if((percorso[m.y][m.x] & (1 << 0)) != 0 && m.ultimaMossa !=1 && m.ultimoArrivo!=1)  {
          m.subY--;
          m.ultimaMossa=0;
        } else {
        
          m.ultimoArrivo=-1;
          switch(m.ultimaMossa){
            case 0:
              m.subY++;
              m.ultimaMossa=1;
              break;
            case 1:
              m.subY--;
              m.ultimaMossa=0;
              break;
            case 2:
              m.subX--;
              m.ultimaMossa=3;
              break;
            case 3:
              m.subX++;
              m.ultimaMossa=2;
              break;
          }
          
        }
        
      }
      else { // playerX > m.x
          
          if ((percorso[m.y][m.x] & (1 << 1)) != 0 && m.ultimaMossa !=0 && m.ultimoArrivo!=0) {
          m.subY++;
          m.ultimaMossa=1;
        } else if ((percorso[m.y][m.x] & (1 << 2)) != 0 && m.ultimaMossa !=3 && m.ultimoArrivo!=3) {
          m.subX++;
          m.ultimaMossa=2;
        } else if ((percorso[m.y][m.x] & (1 << 3)) != 0 && m.ultimaMossa !=2 && m.ultimoArrivo!=2) {
          m.subX--;
          m.ultimaMossa=3;
        } else if((percorso[m.y][m.x] & (1 << 0)) != 0 && m.ultimaMossa !=1 && m.ultimoArrivo!=1)  {
          m.subY--;
          m.ultimaMossa=0;
        } else {
        
          m.ultimoArrivo=-1;
          switch(m.ultimaMossa){
            case 0:
              m.subY++;
              m.ultimaMossa=1;
              break;
            case 1:
              m.subY--;
              m.ultimaMossa=0;
              break;
            case 2:
              m.subX--;
              m.ultimaMossa=3;
              break;
            case 3:
              m.subX++;
              m.ultimaMossa=2;
              break;
          }
          
        }
          
      }
  }
  
  m.nMosse++;
  
  if(m.subX>3){
    m.subX-=3;
    m.x++;
    m.ultimoArrivo=2;
  }
  if(m.subX<0){
    m.subX+=3;
    m.x--;
    m.ultimoArrivo=3;
  }
  if(m.subY>3){
    m.subY-=3;
    m.y++;
    m.ultimoArrivo=1;
  }
  if(m.subY<0){
    m.subY+=3;
    m.y--;
    m.ultimoArrivo=0;
  }
  
  //allineamento ai tunnel
  if(m.ultimaMossa==2 || m.ultimaMossa==3){
    m.subY=3;
  }
  if(m.ultimaMossa==0 || m.ultimaMossa==1){
    m.subX=1;
  }
  
  if(m.x==5 && m.y==6 && ultimoMostro){
    m.passatoDalVia=true;
  }
}

void pookaMoveSpettro(Pooka m){
 if(playerX>m.x && m.x<11){
    m.subX++;
    if(m.subX>3){
      m.subX-=3;
      m.x++;
    }
  }
  if(playerX<m.x && m.x>0){
    m.subX--;
    if(m.subX<0){
      m.subX+=3;
      m.x--;
    }
  }
  if(playerY>m.y && m.y<12){
    m.subY++;
    if(m.subY>3){
      m.subY-=3;
      m.y++;
    }
  }
  if(playerY<m.y && m.y>0){
    m.subY--;
    if(m.subY<0){
      m.subY+=3;
      m.y--;
    }
  }
  
  m.nMosse++;
}

void fygarMoveSpettro(Fygar m){
  if(playerX>m.x && m.x<11){
    m.subX++;
    if(m.subX>3){
      m.subX-=3;
      m.x++;
    }
  }
  if(playerX<m.x && m.x>0){
    m.subX--;
    if(m.subX<0){
      m.subX+=3;
      m.x--;
    }
  }
  if(playerY>m.y && m.y<12){
    m.subY++;
    if(m.subY>3){
      m.subY-=3;
      m.y++;
    }
  }
  if(playerY<m.y && m.y>0){
    m.subY--;
    if(m.subY<0){
      m.subY+=3;
      m.y--;
    }
  }
  
  m.nMosse++;
}

void controlloAttaccoFygar(Fygar f){
  if(playerX >= f.x - 3 && playerX <= f.x + 3 && playerY >= f.y - 1 && playerY <= f.y + 1 && f.gonfiore<=0 && !f.spettro && !f.isGrabbed && !ultimoMostro){
    if(!f.isShooting && clock%200==0){
      f.isShooting=true;
      f.clockAttacco=0;
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
}

void attaccoFygar(Fygar f){
  if(f.isShooting || f.statoAttacco>0){
    switch(f.statoAttacco){
      case -3:
        if(f.clockAttacco%60==0){  
          f.statoAttacco = -2;
          f.isShooting=false;
          f.stato=1;
        }
      break;
      case -2:
        if(f.clockAttacco%20==0){
          if(f.x>3){
            if((mappa[f.y][f.x-3] & ((1 << 5) | (1 << 6) | (1 << 9) | (1 << 10))) == 0) {
              f.statoAttacco = f.isShooting ? -3 : -1;
            }
            else{
              f.statoAttacco = -1;
              f.isShooting=false;
              f.stato=1;
            }
          }
          else{
            f.statoAttacco = -1;
            f.isShooting=false;
            f.stato=1;
          }
        }
      break;
      case -1:
        if(f.clockAttacco%20==0){
          if(f.x>2){
            if((mappa[f.y][f.x-2] & ((1 << 5) | (1 << 6) | (1 << 9) | (1 << 10))) == 0) {
              f.statoAttacco = f.isShooting ? -2 : 0;
            }
            else{
              f.statoAttacco = 0;
              f.isShooting=false;
              f.stato=1;
            }
          }
          else{
            f.statoAttacco = 0;
            f.isShooting=false;
            f.stato=1;
          }
        }
      break;
      case 0:
        if(f.clockAttacco%140==0){
          if(f.direzioneAttacco){  
            if((mappa[f.y][f.x-1] & ((1 << 5) | (1 << 6) | (1 << 9) | (1 << 10))) == 0) {
              f.statoAttacco = -1;
              fygarFiring.rewind();
              fygarFiring.play();
            }
            else{
              f.isShooting=false;
              f.stato=1;
            }
          }
          else{
            if((mappa[f.y][f.x+1] & ((1 << 5) | (1 << 6) | (1 << 9) | (1 << 10))) == 0) {
              f.statoAttacco = 1;
              fygarFiring.rewind();
              fygarFiring.play();
            }
            else{
              f.isShooting=false;
              f.stato=1;
            }
          }
        }
      break;
      case 1:
        if(f.clockAttacco%20==0){
          if(f.x<10){
            if((mappa[f.y][f.x+2] & ((1 << 5) | (1 << 6) | (1 << 9) | (1 << 10))) == 0) {
              f.statoAttacco = f.isShooting ? 2 : 0;
            }
            else{
              f.statoAttacco = 0;
              f.isShooting=false;
              f.stato=1;
            }
          }
          else{
            f.statoAttacco = 0;
            f.isShooting=false;
            f.stato=1;
          }
        }
      break;
      case 2:
        if(f.clockAttacco%20==0){
          if(f.x<9){  
            if((mappa[f.y][f.x+3] & ((1 << 5) | (1 << 6) | (1 << 9) | (1 << 10))) == 0) {
              f.statoAttacco = f.isShooting ? 3 : 1;
            }
            else{
              f.statoAttacco = 1;
              f.isShooting=false;
              f.stato=1;
            }
          }
          else{
            f.statoAttacco = 0;
            f.isShooting=false;
            f.stato=1;
          }
        }
      break;
      case 3:
        if(f.clockAttacco%60==0){
          f.statoAttacco = 2;
          f.isShooting=false;
          f.stato=1;
        }
      break;
    }
  }
}

void fugaFinalePooka(Pooka m){
    
  if ((percorso[m.y][m.x] & (1 << 0)) != 0 && m.ultimaMossa != 1 && m.y>0 && m.ultimoArrivo!=1) {
    m.subY--;
    m.ultimaMossa=0;
  } else if ((percorso[m.y][m.x] & (1 << 3)) != 0 && m.ultimaMossa != 2 && m.x>0 && m.ultimoArrivo!=2) {
    m.subX--;
    m.ultimaMossa=3;
  } else if ((percorso[m.y][m.x] & (1 << 2)) != 0 && m.ultimaMossa != 3 && m.x<11 && m.ultimoArrivo!=3) {
    m.subX++;
    m.ultimaMossa=2;
  } else if((percorso[m.y][m.x] & (1 << 1)) != 0 && m.ultimaMossa != 0 && m.y<12 && m.ultimoArrivo!=0)  {
    m.subY++;
    m.ultimaMossa=1;
  } else {
  
    m.ultimoArrivo=-1;
    switch(m.ultimaMossa){
      case 0:
        m.subY++;
        m.ultimaMossa=1;
        break;
      case 1:
        m.subY--;
        m.ultimaMossa=0;
        break;
      case 2:
        m.subX--;
        m.ultimaMossa=3;
        break;
      case 3:
        m.subX++;
        m.ultimaMossa=2;
        break;
    }
    
  }
  
  m.nMosse++;
  
  if(m.subX>3){
    m.subX-=3;
    m.x++;
    m.ultimoArrivo=2;
  }
  if(m.subX<0){
    m.subX+=3;
    m.x--;
    m.ultimoArrivo=3;
  }
  if(m.subY>3){
    m.subY-=3;
    m.y++;
    m.ultimoArrivo=1;
  }
  if(m.subY<0){
    m.subY+=3;
    m.y--;
    m.ultimoArrivo=0;
  }
  
  //allineamento ai tunnel
  if(m.ultimaMossa==2 || m.ultimaMossa==3){
    m.subY=3;
  }
  if(m.ultimaMossa==0 || m.ultimaMossa==1){
    m.subX=1;
  }
}

void fugaFinaleFygar(Fygar m){
  
  if ((percorso[m.y][m.x] & (1 << 0)) != 0 && m.ultimaMossa != 1 && m.y>0 && m.ultimoArrivo!=1) {
    m.subY--;
    m.ultimaMossa=0;
  } else if ((percorso[m.y][m.x] & (1 << 3)) != 0 && m.ultimaMossa != 2 && m.x>0 && m.ultimoArrivo!=2) {
    m.subX--;
    m.ultimaMossa=3;
  } else if ((percorso[m.y][m.x] & (1 << 2)) != 0 && m.ultimaMossa != 3 && m.x<11 && m.ultimoArrivo!=3) {
    m.subX++;
    m.ultimaMossa=2;
  } else if((percorso[m.y][m.x] & (1 << 1)) != 0 && m.ultimaMossa != 0 && m.y<12 && m.ultimoArrivo!=0)  {
    m.subY++;
    m.ultimaMossa=1;
  } else {
  
    m.ultimoArrivo=-1;
    switch(m.ultimaMossa){
      case 0:
        m.subY++;
        m.ultimaMossa=1;
        break;
      case 1:
        m.subY--;
        m.ultimaMossa=0;
        break;
      case 2:
        m.subX--;
        m.ultimaMossa=3;
        break;
      case 3:
        m.subX++;
        m.ultimaMossa=2;
        break;
    }
    
  }
  
  m.nMosse++;
  
  if(m.subX>3){
    m.subX-=3;
    m.x++;
    m.ultimoArrivo=2;
  }
  if(m.subX<0){
    m.subX+=3;
    m.x--;
    m.ultimoArrivo=3;
  }
  if(m.subY>3){
    m.subY-=3;
    m.y++;
    m.ultimoArrivo=1;
  }
  if(m.subY<0){
    m.subY+=3;
    m.y--;
    m.ultimoArrivo=0;
  }
  
  //allineamento ai tunnel
  if(m.ultimaMossa==2 || m.ultimaMossa==3){
    m.subY=3;
  }
  if(m.ultimaMossa==0 || m.ultimaMossa==1){
    m.subX=1;
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
