void draw(){
  update();
  background(0);
  if(partita){
    drawMap();
    drawPlayer();
    drawMostri();
    drawRoccie();
    drawGUI();
  }
  else{
    background(menu);
  }
}

void drawMap(){
  
  imageMode(CORNER);
  xStampa=0;
  yStampa=64;
  
  for(int r = 0; r < 13; r++){
    for(int c = 0; c < 12; c++){
      
      switch(r){
        case 0:
        //strato cielo
        break;
        case 1:
        case 2:
        case 3:
          image(terreno[coloreLivello][0], xStampa, yStampa);
          break;
        case 4:
        case 5:
        case 6:
          image(terreno[coloreLivello][1], xStampa, yStampa);
          break;
        case 7:
        case 8:
        case 9:
          image(terreno[coloreLivello][2], xStampa, yStampa);
          break;
        case 10:
        case 11:
        case 12:
          image(terreno[coloreLivello][3], xStampa, yStampa);
          break;  
      }
      
      switch (mappa[r][c]) {
        case 0:
          image(tunnel0, xStampa, yStampa);
          break;
        case 15:
          image(tunnel15, xStampa, yStampa);
          break;
        case 47:
          image(tunnel47, xStampa, yStampa);
          break;
        case 79:
          image(tunnel79, xStampa, yStampa);
          break;
        case 111:
          image(tunnel111, xStampa, yStampa);
          break;
        case 559:
          image(tunnel559, xStampa, yStampa);
          break;
        case 1103:
          image(tunnel1103, xStampa, yStampa);
          break;
        case 1647:
          image(tunnel1647, xStampa, yStampa);
          break;
        case 4369:
          image(tunnel4369, xStampa, yStampa);
          break;
        case 4383:
          image(tunnel4383, xStampa, yStampa);
          break;
        case 4401:
          image(tunnel4401, xStampa, yStampa);
          break;
        case 4415:
          image(tunnel4415, xStampa, yStampa);
          break;
        case 4465:
          image(tunnel4465, xStampa, yStampa);
          break;
        case 4479:
          image(tunnel4479, xStampa, yStampa);
          break;
        case 4881:
          image(tunnel4881, xStampa, yStampa);
          break;
        case 4913:
          image(tunnel4913, xStampa, yStampa);
          break;
        case 4927:
          image(tunnel4927, xStampa, yStampa);
          break;
        case 5905:
          image(tunnel5905, xStampa, yStampa);
          break;
        case 6001:
          image(tunnel6001, xStampa, yStampa);
          break;
        case 6015:
          image(tunnel6015, xStampa, yStampa);
          break;
        case 34952:
          image(tunnel34952, xStampa, yStampa);
          break;
        case 34959:
          image(tunnel34959, xStampa, yStampa);
          break;
        case 35016:
          image(tunnel35016, xStampa, yStampa);
          break;
        case 35023:
          image(tunnel35023, xStampa, yStampa);
          break;
        case 35048:
          image(tunnel35048, xStampa, yStampa);
          break;
        case 35055:
          image(tunnel35055, xStampa, yStampa);
          break;
        case 35976:
          image(tunnel35976, xStampa, yStampa);
          break;
        case 36047:
          image(tunnel36047, xStampa, yStampa);
          break;
        case 36048:
          image(tunnel36048, xStampa, yStampa);
          break;
        case 36488:
          image(tunnel36488, xStampa, yStampa);
          break;
        case 36584:
          image(tunnel36584, xStampa, yStampa);
          break;
        case 36591:
          image(tunnel36591, xStampa, yStampa);
          break;
        case 39321:
          image(tunnel39321, xStampa, yStampa);
          break;
        case 39327:
          image(tunnel39327, xStampa, yStampa);
          break;
        case 39417:
          image(tunnel39417, xStampa, yStampa);
          break;
        case 39423:
          image(tunnel39423, xStampa, yStampa);
          break;
        case 40857:
          image(tunnel40857, xStampa, yStampa);
          break;
        case 40953:
          image(tunnel40953, xStampa, yStampa);
          break;
        case 40959:
          image(tunnel40959, xStampa, yStampa);
          break;
        case 61440:
          image(tunnel61440, xStampa, yStampa);
          break;
        case 61455:
          image(tunnel61455, xStampa, yStampa);
          break;
        case 61713:
          image(tunnel61713, xStampa, yStampa);
          break;
        case 61727:
          image(tunnel61727, xStampa, yStampa);
          break;
        case 61952:
          image(tunnel61952, xStampa, yStampa);
          break;
        case 61984:
          image(tunnel61984, xStampa, yStampa);
          break;
        case 61999:
          image(tunnel61999, xStampa, yStampa);
          break;
        case 62225:
          image(tunnel62225, xStampa, yStampa);
          break;
        case 62257:
          image(tunnel62257, xStampa, yStampa);
          break;
        case 62271:
          image(tunnel62271, xStampa, yStampa);
          break;
        case 62464:
          image(tunnel62464, xStampa, yStampa);
          break;
        case 62528:
          image(tunnel62528, xStampa, yStampa);
          break;
        case 62543:
          image(tunnel62543, xStampa, yStampa);
          break;
        case 62972:
          image(tunnel62972, xStampa, yStampa);
          break;
        case 63072:
          image(tunnel63072, xStampa, yStampa);
          break;
        case 63087:
          image(tunnel63087, xStampa, yStampa);
          break;
        case 63249:
          image(tunnel63249, xStampa, yStampa);
          break;
        case 63345:
          image(tunnel63345, xStampa, yStampa);
          break;
        case 63359:
          image(tunnel63359, xStampa, yStampa);
          break;
        case 63624:
          image(tunnel63624, xStampa, yStampa);
          break;
        case 63631:
          image(tunnel63631, xStampa, yStampa);
          break;
        case 63897:
          image(tunnel63897, xStampa, yStampa);
          break;
        case 64648:
          image(tunnel64648, xStampa, yStampa);
          break;
        case 64712:
          image(tunnel64712, xStampa, yStampa);
          break;
        case 64719:
          image(tunnel64719, xStampa, yStampa);
          break;
        case 65160:
          image(tunnel65160, xStampa, yStampa);
          break;
        case 65256:
          image(tunnel65256, xStampa, yStampa);
          break;
        case 65263:
          image(tunnel65263, xStampa, yStampa);
          break;
        case 65433:
          image(tunnel65433, xStampa, yStampa);
          break;
        case 65529:
          image(tunnel65529, xStampa, yStampa);
          break;
        case 65535:
          break;
        default:
          println(mappa[r][c]);
          break;
      }
      
      xStampa+=64; //mettere larghezza casella al posto dello 0
    }
    
    xStampa=0;
    yStampa+=64; //mettere altezza casella al posto dello 0
  }
  
  fioriGrandi= int ((livello+1)%100)/10;
  fioriPiccoli= (livello+1)%10;
  xStampa=704;
  
  for(int i=0;i<fioriGrandi;i++){
    image(fiore10[i%2],xStampa,36);
    xStampa-=64;
  }
  for(int i=0;i<fioriPiccoli;i++){
    image(fiore,xStampa,68);
    xStampa-=64;
  }
}

void drawPlayer() {
  imageMode(CENTER);
  currentFrame = (clock / frameDelay) % 2;
  if (comandoMossa == 0) {
    currentFrame = 0;
  }

  switch (ultimaMossa) {
    case 1:
      direzionePlayer = (direzionePlayerSalita == 2) ? 5 : 2;
      break;
    case 2:
      direzionePlayer = (direzionePlayerSalita == 2) ? 4 : 1;
      break;
    case 3:
      direzionePlayer = 0;
      break;
    case 4:
      direzionePlayer = 3;
      break;
  }

  PImage img = staScavando ? animazionePlayerScavo[currentFrame][direzionePlayer] : animazionePlayerCamminata[currentFrame][direzionePlayer];

  image(img, (playerX * 64 + playerSubX * 16) + 16, (playerY * 64 + playerSubY * 16) + 80);
}


void drawMostri(){
  imageMode(CENTER);
  
  // Disegna i Pooka
  for (Pooka p : pooka) {
    int xPos = (p.x * 64 + p.subX * 16) + 16;
    int yPos = (p.y * 64 + p.subY * 16) + 52;
    
    if (p.gonfiore > 0) {
      // Pooka gonfiato
      int frame = (clock / 10) % 2; // Animazione più lenta per il gonfiore
      image(animazionePookaGonfiato[p.gonfiore-1][frame], xPos, yPos);
    } 
    else if (p.spettro) {
      // Pooka in modalità fantasma
      int frame = (clock / 10) % 2;
      image(animazionePookaFantasma[frame], xPos, yPos);
    } 
    else {
      // Pooka normale
      int frame = (clock / 10) % 2; // Animazione più veloce per il movimento normale
      int dir = (p.stato == 0) ? 0 : 1; // 0=sinistra, 1=destra
      image(animazionePooka[dir][frame], xPos, yPos);
    }
  }
  
  for (Fygar f : fygar) {
    int xPos = (f.x * 64 + f.subX * 16) + 16;
    int yPos = (f.y * 64 + f.subY * 16) + 48;
    
    if (f.gonfiore > 0) {
      // Pooka gonfiato
      int frame = (clock / 10) % 2; // Animazione più lenta per il gonfiore
      image(fygarGonfiore[f.gonfiore-1][frame], xPos, yPos);
    } 
    else if (f.spettro) {
      // Pooka in modalità fantasma
      int frame = (clock / 10) % 2;
      image(fygarFantasma[frame], xPos, yPos);
    } 
    else {
      // Pooka normale
      int frame = (clock / 10) % 2; // Animazione più veloce per il movimento normale
      int dir = (f.stato == 0) ? 0 : 1; // 0=sinistra, 1=destra
      image(fygarAnimazione[dir][frame], xPos, yPos);
    }
  }
}

void drawRoccie(){
  imageMode(CORNER);
  
  for (Roccia r : roccia){  
    if(r.sbriciolamento>0){
      image(rocciaCadente[r.sbriciolamento-1],(r.x * 64),((r.y * 64 + r.subY * 16)+64));
    }
    else if(r.sbriciolamento!=-1){
      image(rocciaFerma,(r.x * 64),((r.y * 64 + r.subY * 16)+64));
    } 
  }
}

void drawGUI(){
  int nViteD = (nVite > 8) ? 8 : nVite;
  imageMode(CORNER);
  textSize(32);
  xStampa=0;
  for(int i=0;i<nViteD;i++){
    image(animazionePlayerScavo[0][0],xStampa,896);
    xStampa+=64;
  }
  text("ROUND",640,928);
  text(livello,640,960);
  text("SCORE:",16,32);
  text(score,128,32);
  
  if(tempoTesto>0){
    textSize(64);
    text("PLAYER 1\n\n\n READY!",224,384);
  }
  
  if(drawFrutto){
    image(frutti[(livello+2)%10],320,448);
  }
}

void animazioneIniziale(){

}
