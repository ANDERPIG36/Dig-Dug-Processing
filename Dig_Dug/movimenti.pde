void move() {
  switch (comandoMossa){
    case 0:
     playerFermo=true;
     break;
    case 1:
      if(isMacigno(playerX,playerY-1) || playerSubY>1){
        if(playerY>0||playerSubY>0){
          if(playerSubX==1){
            playerSubY--;
            if(playerSubY<0){
              playerSubY+= 4;
              playerY--;
            }
            ultimaMossa = comandoMossa;
          }
          else{
            if((ultimaMossa==3&&(playerX<11||playerSubX<1)) && isMacigno(playerX+1,playerY)){
              playerSubX++;
              if(playerSubX>3){
                playerSubX-= 4;
                playerX++;
              }
            }
            else if((playerX>0||playerSubX>1) && isMacigno(playerX,playerY-1)){
              playerSubX--;
              if(playerSubX<0){
                playerSubX+= 4;
                playerX--;
              }
            }
          }
        }
        playerFermo=false;
      }
      break;
    case 2:
      if(isMacigno(playerX,playerY+1) || playerSubY<3){
        if(playerY<12||playerSubY<1){
          if(playerSubX==1){
            playerSubY++;
            if(playerSubY>3){
              playerSubY-= 4;
              playerY++;
            }
            ultimaMossa = comandoMossa;
          }
          else{
            if((ultimaMossa==3&&(playerX<11||playerSubX<1)) && isMacigno(playerX+1,playerY)){
              playerSubX++;
              if(playerSubX>3){
                playerSubX-= 4;
                playerX++;
              }
            }
            else if((playerX>0||playerSubX>1) && isMacigno(playerX+1,playerY-1)){
              playerSubX--;
              if(playerSubX<0){
                playerSubX+= 4;
                playerX--;
              }
            }
          }
        }
        playerFermo=false;
      }
      break;
    case 3:
      if(isMacigno(playerX+1,playerY) || playerSubX<3){
        if(playerX<11||playerSubX<1){
          if(playerSubY==1){
            playerSubX++;
            if(playerSubX>3){
              playerSubX-= 4;
              playerX++;
            }
            ultimaMossa = comandoMossa;
          }
          else{
            if((ultimaMossa==1&&(playerY>0||playerSubY>0)) && isMacigno(playerX+1,playerY)){
              playerSubY--;
              if(playerSubY<0){
                playerSubY+= 4;
                playerY--;
              }
            }
            else if((playerY<12||playerSubY<1) && isMacigno(playerX+1,playerY) && isMacigno(playerX,playerY)){
              playerSubY++;
              if(playerSubY>3){
                playerSubY-= 4;
                playerY++;
              }
            }
          }
        }
        playerFermo=false;
      }
      break;
    case 4:
      if(isMacigno(playerX-1,playerY) || playerSubX>1){
        if(playerX>0||playerSubX>1){
          if(playerSubY==1){
            playerSubX--;
            if(playerSubX<0){
              playerSubX+= 4;
              playerX--;
            }
            ultimaMossa = comandoMossa;
          }
          else{
            if((ultimaMossa==1&&(playerY>0||playerSubY>0)) && isMacigno(playerX-1,playerY)){
              playerSubY--;
              if(playerSubY<0){
                playerSubY+= 4;
                playerY--;
              }
            }
            else if((playerY<12||playerSubY<1) && isMacigno(playerX-1,playerY) && isMacigno(playerX,playerY)){
              playerSubY++;
              if(playerSubY>3){
                playerSubY-= 4;
                playerY++;
              }
            }
          }
        }
        playerFermo=false;
      }
      break;
  }
}

void gestioneAttacco(){
  if(!mostroGrabbato){
    attacco();
  }
}

void attacco(){
  switch(direzionePlayerSalita){
    case 0:
      if(fineAttaccoX-playerX<4 && attaccoAvanzando){
        fineAttaccoX++;
      }
      else if(fineAttaccoX-playerX>=0 && !attaccoAvanzando){
        fineAttaccoX--;
      }
      break;
    case 1:
    case 4:
      if(playerY-fineAttaccoY<4 && attaccoAvanzando){
        fineAttaccoX--;
      }
      else if(playerY-fineAttaccoY>=0 && !attaccoAvanzando){
        fineAttaccoY++;
      }
      break;
    case 3:
      if(playerX-fineAttaccoX<4 && attaccoAvanzando){
        fineAttaccoX--;
      }
      else if(playerX-fineAttaccoX>=0 && !attaccoAvanzando){
        fineAttaccoX++;
      }
      break;
    case 2:
    case 5:
      if(fineAttaccoY-playerY<4 && attaccoAvanzando){
        fineAttaccoY++;
      }
      else if(fineAttaccoY-playerY>=0 && !attaccoAvanzando){
        fineAttaccoY--;
      }
      break;
  }
}

void pompaMostro(){
  for (Pooka p : pooka) {
    if(p.isGrabbed){
      pumping.rewind();
      pumping.play();
      p.gonfiore++;
    }
  }
  
  for (Fygar f : fygar) {
    if(f.isGrabbed){
      pumping.rewind();
      pumping.play();
      f.gonfiore++;
    }
  }
}

boolean isMacigno(int xCasellaDopo, int yCasellaDopo){
  for(Roccia r : roccia){
    if(r.x==xCasellaDopo && r.y==yCasellaDopo && r.sbriciolamento!=-1){
      return false;
    }
  }
  return true;
}
