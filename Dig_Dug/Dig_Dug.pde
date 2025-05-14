void setup(){
  size(768,960);
  frameRate(60);
  inizializzaAsset();
  textFont(font);
  livello = 0;
  nVite = 3;
  score = 0;
  assegnaLivello();
  tempoTesto=100;
}

void update() {
  if(partita){
    if(clock%6==1){
      move();
    }
    scavoMatrice();
    aggiornaMatrice();
    controlloEventi();
  }
  clock++;
  tempoTesto--;
}
