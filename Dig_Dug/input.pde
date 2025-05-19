void keyPressed() {
  switch (keyCode) {
    case UP:
      comandoMossa=1;
      if(ultimaMossa==3)
        direzionePlayerSalita=1;
      else if(ultimaMossa==4)
        direzionePlayerSalita=2;
      staAttaccando=false;
      break;
    case DOWN:
      comandoMossa=2;
      if(ultimaMossa==3)
        direzionePlayerSalita=1;
      else if(ultimaMossa==4)
        direzionePlayerSalita=2; 
      staAttaccando=false;
      break;
    case RIGHT:
      comandoMossa=3;
      staAttaccando=false;
      break;
    case LEFT:
      comandoMossa=4;
      staAttaccando=false;
      break;
    case ENTER:
      if(!partita){
        gameStarted.rewind();
        gameStarted.play();
        delay(600);
        tempoVideo=250;
        videoIniziale.play();
      }
      break;
    case 'Z':
      if(mostroGrabbato){
        pompaMostro();
      }
      else if(!staAttaccando){
        staAttaccando=true;
        attaccoAvanzando=true;
        fineAttaccoX=playerX;
        fineAttaccoY=playerY;
      }
      break;
  }
}

void keyReleased() {
  switch (keyCode) {
    case UP:
      comandoMossa=0;
      break;
    case DOWN:
      comandoMossa=0;
      break;
    case RIGHT:
      comandoMossa=0;
      break;
    case LEFT:
      comandoMossa=0;
      break;
  }
}
