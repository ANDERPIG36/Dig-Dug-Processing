void mobIA(){
  
  for (Pooka p : pooka) {
    if(ultimoMostro){
      p.stato=3;
    }
    switch(p.stato){
      
    }
  }
  
  for (Fygar f : fygar) {
    
    if(ultimoMostro){
      f.stato=3;
    }
    else if(playerX >= f.x - 3 && playerX <= f.x + 3 && playerY >= f.y - 3 && playerY <= f.y + 3){
      f.isShooting=true;
      f.stato=4;
      if (playerX > f.x) {
        //spara a destra
        f.direzioneAttacco=false;
      } 
      else if (playerX < f.x) {
        //spara a sinistra
        f.direzioneAttacco=true;
      } 
      else {
        if(ultimaMossa==3){
          //spara a destra
          f.direzioneAttacco=false;
        }
        else{
          //spara a sinistra
          f.direzioneAttacco=true;
        }
      }
    }
    
    
    if(f.isShooting || f.statoAttacco>0){
      switch(f.statoAttacco){
        case -3:
          if(clock%160==0){
            f.statoAttacco = -2;
            f.isShooting=false;
          }
        break;
        case -2:
          if(clock%80==0){
            f.statoAttacco = f.isShooting ? -3 : -1;
          }
        break;
        case -1:
          if(clock%80==0){
            f.statoAttacco = f.isShooting ? -2 : 0;
          }
        break;
        case 0:
          if(clock%160==0){
            f.statoAttacco = f.direzioneAttacco ? -1 : 1;
          }
        break;
        case 1:
          if(clock%80==0){
            f.statoAttacco = f.isShooting ? 2 : 0;
          }
        break;
        case 2:
          if(clock%80==0){
            f.statoAttacco = f.isShooting ? 3 : 1;
          }
        break;
        case 3:
          if(clock%160==0){
            f.statoAttacco = 2;
            f.isShooting=false;
          }
        break;
      }
    }
  }
}
