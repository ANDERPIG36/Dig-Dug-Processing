void morte(){
  nVite--;
  delay(1000);
  digDugWalking.pause();
  digDugWalkingFast.pause();
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
    fineAttaccoX=playerX;
    fineAttaccoY=playerY;
    attaccoAvanzando=false;
    mostroGrabbato=false;
    staAttaccando=false;
    resettaNemici();
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

void resettaNemici() {
  for (Pooka p : pooka) {
    p.x = p.Xiniziale;
    p.y = p.Yiniziale;
    p.subX = 1;
    p.subY = 3;
    p.stato = 0;
    p.spettro = false;
    p.nMosse = 0;
    p.gonfiore=0;
  }
  for (Fygar f : fygar) {
    f.x = f.Xiniziale;
    f.y = f.Yiniziale;
    f.subX = 1;
    f.subY = 3;
    f.stato = 0;
    f.spettro = false;
    f.nMosse = 0;
    f.gonfiore = 0;
    f.statoAttacco = 0;
    f.isShooting=false;
    f.stato=1;
  }
}
