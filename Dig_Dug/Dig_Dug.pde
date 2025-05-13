void setup(){
  size(1000,1000);
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
