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
            else if((playerX>0||playerSubX>1) && isMacigno(playerX-1,playerY)){
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
            else if((playerX>0||playerSubX>1) && isMacigno(playerX-1,playerY-1)){
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
            if((ultimaMossa==1&&(playerY>0||playerSubY>0)) && isMacigno(playerX,playerY-1)){
              playerSubY--;
              if(playerSubY<0){
                playerSubY+= 4;
                playerY--;
              }
            }
            else if((playerY<12||playerSubY<1) && isMacigno(playerX,playerY+1)){
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
            if((ultimaMossa==1&&(playerY>0||playerSubY>0)) && isMacigno(playerX,playerY-1)){
              playerSubY--;
              if(playerSubY<0){
                playerSubY+= 4;
                playerY--;
              }
            }
            else if((playerY<12||playerSubY<1) && isMacigno(playerX,playerY+1)){
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

void IniziaAttacco(){
  switch(ultimaMossa){
    case 1:
      attacco=true;
    case 2:
    case 3:
    case 4:
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
