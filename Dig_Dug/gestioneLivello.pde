void morte(){
  nVite--;
  delay(1000);
  if(nVite>0){
    assegnaLivello();
  }
  else{
    livello=0;
    nVite=3;
    score=0;
    assegnaLivello();
    tempoTesto=100;
  }
}
