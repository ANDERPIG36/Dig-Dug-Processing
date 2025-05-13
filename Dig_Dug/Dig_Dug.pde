void setup(){
  size(768,960);
  frameRate(60);
  inizializzaImmagini();
  livello = 0;
  nVite = 3;
  assegnaLivello();
}

void update() {
  move();
  scavoMatrice();
  aggiornaMatrice();
  controlloEventi();
}
