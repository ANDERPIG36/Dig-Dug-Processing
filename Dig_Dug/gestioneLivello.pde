void morte(){
  nVite--;
  delay(1000);
  deathDigDug.rewind();
  deathDigDug.play();
  delay(2500);
  if(nVite>0){
    playerX=5;
    playerY=6;
    playerSubX=1;
    playerSubY=1;
    ultimaMossa=3;
    direzionePlayer=0;
    isPlayerSchiacciato = false;
  }
  else{
    gameover.rewind();
    gameover.play();
    delay(2500);
    livello=0;
    nVite=3;
    score=0;
    roccieCadute=0;
    assegnaLivello();
    tempoTesto=100;
  }
}

void controlloNextLevel(){
   if(fygar.isEmpty() && pooka.isEmpty()){
    roundClear.rewind();
    roundClear.play();
    delay(2500);
    livello++;
    roccieCadute=0;
    assegnaLivello();
   }
}
