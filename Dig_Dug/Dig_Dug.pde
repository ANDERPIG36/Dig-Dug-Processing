import processing.video.*;

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
    controlloNextLevel();
    gestioneAttacco();
    
    if (!playerFermo) {
      if (!ultimoMostro) {
        // Se non sta già suonando, fallo partire
        if (!digDugWalking.isPlaying()) {
          digDugWalking.rewind();
          digDugWalking.play();
        }
    
        // Metti in pausa e riavvolgi l'altro solo se sta suonando
        if (digDugWalkingFast.isPlaying()) {
          digDugWalkingFast.pause();
          digDugWalkingFast.rewind();
        }
      } else {
        if (!digDugWalkingFast.isPlaying()) {
          digDugWalkingFast.rewind();
          digDugWalkingFast.play();
        }
    
        if (digDugWalking.isPlaying()) {
          digDugWalking.pause();
          digDugWalking.rewind();
        }
      }
    } else {
      if (digDugWalking.isPlaying()) {
        digDugWalking.pause();
        digDugWalking.rewind();
      }
      if (digDugWalkingFast.isPlaying()) {
        digDugWalkingFast.pause();
        digDugWalkingFast.rewind();
      }
    }
    
  }
  tempi();
  println(clock);
  
}

void tempi(){
  clock++;
  tempoTesto--;
  if(tempoVideo>1){
    tempoVideo--;
  }
  if(tempoFrutto>0){
    tempoFrutto--;
  }
  if(tempoVideo<100&&tempoVideo>0){
    partita=true;
  }
  tempoPompa++;
  timerPompaggio--;
  if(timerPompaggio<0){
    pompaggio=1;
  }
}
