void keyPressed() {
  switch (keyCode) {
    case UP:
      comandoMossa=1;
      if(ultimaMossa==3)
        direzionePlayerSalita=1;
      else if(ultimaMossa==4)
        direzionePlayerSalita=2; 
      break;
    case DOWN:
      comandoMossa=2;
      if(ultimaMossa==3)
        direzionePlayerSalita=1;
      else if(ultimaMossa==4)
        direzionePlayerSalita=2; 
      break;
    case RIGHT:
      comandoMossa=3;
      break;
    case LEFT:
      comandoMossa=4;
      break;
    case ENTER:
      if(!partita){
        gameStarted.rewind();
        gameStarted.play();
        animazioneIniziale();
        partita=true;
      }
      break;
    case 'Z':
      IniziaAttacco();
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
