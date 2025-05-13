void move() {
  switch (comandoMossa){
    case 0:
     break;
    case 1:
      if(playerSubX==1){
        playerSubY--;
        if(playerSubY<0){
          playerSubY+= 4;
          playerY--;
        }
      }
      else{
        if(ultimaMossa==3){
          playerSubX++;
          if(playerSubX>3){
            playerSubX-= 4;
            playerX++;
          }
        }
        else{
          playerSubX--;
          if(playerSubX<0){
            playerSubX+= 4;
            playerX--;
          }
        }
      }
      break;
    case 2:
      if(playerSubX==1){
        playerSubY++;
        if(playerSubY>3){
          playerSubY-= 4;
          playerY++;
        }
      }
      else{
        if(ultimaMossa==3){
          playerSubX++;
          if(playerSubX>3){
            playerSubX-= 4;
            playerX++;
          }
        }
        else{
          playerSubX--;
          if(playerSubX<0){
            playerSubX+= 4;
            playerX--;
          }
        }
      }
      break;
    case 3:
      if(playerSubY==1){
        playerSubX++;
        if(playerSubX>3){
          playerSubX-= 4;
          playerX++;
        }
      }
      else{
        if(ultimaMossa==1){
          playerSubY--;
          if(playerSubY<0){
            playerSubY+= 4;
            playerY--;
          }
        }
        else{
          playerSubY++;
          if(playerSubY>3){
            playerSubY-= 4;
            playerY++;
          }
        }
      }
      break;
    case 4:
      if(playerSubY==1){
        playerSubX--;
        if(playerSubX<0){
          playerSubX+= 4;
          playerX--;
        }
      }
      else{
        if(ultimaMossa==1){
          playerSubY--;
          if(playerSubY<0){
            playerSubY+= 4;
            playerY--;
          }
        }
        else{
          playerSubY++;
          if(playerSubY>3){
            playerSubY-= 4;
            playerY++;
          }
        }
      }
      break;
  }
  ultimaMossa = comandoMossa;
}
