void draw(){
  background(0);
  drawMap();
  stampaPlayer();  
}

void drawMap(){
  imageMode(CORNER);
  xStampa=0;
  yStampa=0;
  for(int r = 0; r < 13; r++){
    for(int c = 0; c < 12; c++){
      switch(mappa[r][c]){
      
      }
      xStampa+=0; //mettere larghezza casella al posto dello 0
    }
    xStampa=0;
    yStampa+=0; //mettere altezza casella al posto dello 0
  }
}

void stampaPlayer(){
  
}
