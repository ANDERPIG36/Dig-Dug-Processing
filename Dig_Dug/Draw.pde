void draw(){
  background(0);
  drawMap();
  drawPlayer();
  drawMostri();
  drawRoccie();
}

void drawMap(){
  imageMode(CORNER);
  xStampa=0;
  yStampa=0;
  for(int r = 0; r < 13; r++){
    for(int c = 0; c < 12; c++){
      
      switch(r){
        case 0:
        //strato cielo
        break;
        case 1:
        case 2:
        case 3:
        break;
        case 4:
        case 5:
        case 6:
        break;
        case 7:
        case 8:
        case 9:
        break;
        case 10:
        case 11:
        case 12:
        break;
      }
      
      switch(mappa[r][c]){
        default:
          println(mappa[r][c]);      
        break;
      }
      
      xStampa+=0; //mettere larghezza casella al posto dello 0
    }
    xStampa=0;
    yStampa+=0; //mettere altezza casella al posto dello 0
  }
}

void drawPlayer(){
  
}

void drawMostri(){
  
}

void drawRoccie(){
  
}
