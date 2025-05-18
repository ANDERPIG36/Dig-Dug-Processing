import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

void setup(){
  size(768,960);
  minim = new Minim(this);
  frameRate(60);
  inizializzaAsset();
  textFont(font);
  livello = 0;
  nVite = 3;
  score = 0;
  roccieCadute=0;
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
