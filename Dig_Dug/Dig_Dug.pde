void setup(){
  size(1000,1000);
  frameRate(60);
  inizializzaImmagini();
  assegnaLivello();
}

void update() {
  move();
  scavoMatrice();
  controlloCollisioni();
}
