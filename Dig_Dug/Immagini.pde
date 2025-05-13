int coloreLivello;
PImage[][] terreno = new PImage[3][4];
PImage tunnel0, tunnel15, tunnel47, tunnel79, tunnel111, tunnel559, tunnel1103, tunnel1647, tunnel4369, tunnel4383,
  tunnel4401, tunnel4415, tunnel4465, tunnel4479, tunnel4881, tunnel4913, tunnel4927, tunnel5905, tunnel6001, tunnel6015,
  tunnel34952, tunnel34959, tunnel35016, tunnel35023, tunnel35048, tunnel35055, tunnel35976, tunnel36047, tunnel36448, tunnel36488,
  tunnel36584, tunnel36591, tunnel39321, tunnel39327, tunnel39417, tunnel39423, tunnel40857, tunnel40953, tunnel40959, tunnel61440,
  tunnel61455, tunnel61713, tunnel61727, tunnel61952, tunnel61984, tunnel61999, tunnel62225, tunnel62257, tunnel62271, tunnel62464,
  tunnel62528, tunnel62543, tunnel62972, tunnel63072, tunnel63087, tunnel63249, tunnel63345, tunnel63359, tunnel63624, tunnel63631,
  tunnel63897, tunnel64648, tunnel64712, tunnel64719, tunnel65160, tunnel65256, tunnel65263, tunnel65433, tunnel65529;



void inizializzaImmagini(){
  for(int i=0; i<3; i++){
    for(int j=0; j<4; j++){
      terreno[i][j] = loadImage("terreno/terreno"+(i+1)+""+(j+1)+".png");
    }
  }
  
  PImage tunnel0 = loadImage("scavi/tunnel_0.png");
  PImage tunnel15 = loadImage("scavi/tunnel_15.png");
  PImage tunnel47 = loadImage("scavi/tunnel_47.png");
  PImage tunnel79 = loadImage("scavi/tunnel_79.png");
  PImage tunnel111 = loadImage("scavi/tunnel_111.png");
  PImage tunnel559 = loadImage("scavi/tunnel_559.png");
  PImage tunnel1103 = loadImage("scavi/tunnel_1103.png");
  PImage tunnel1647 = loadImage("scavi/tunnel_1647.png");
  PImage tunnel4369 = loadImage("scavi/tunnel_4369.png");
  PImage tunnel4383 = loadImage("scavi/tunnel_4383.png");
  PImage tunnel4401 = loadImage("scavi/tunnel_4401.png");
  PImage tunnel4415 = loadImage("scavi/tunnel_4415.png");
  PImage tunnel4465 = loadImage("scavi/tunnel_4465.png");
  PImage tunnel4479 = loadImage("scavi/tunnel_4479.png");
  PImage tunnel4881 = loadImage("scavi/tunnel_4881.png");
  PImage tunnel4913 = loadImage("scavi/tunnel_4913.png");
  PImage tunnel4927 = loadImage("scavi/tunnel_4927.png");
  PImage tunnel5905 = loadImage("scavi/tunnel_5905.png");
  PImage tunnel6001 = loadImage("scavi/tunnel_6001.png");
  PImage tunnel6015 = loadImage("scavi/tunnel_6015.png");
  PImage tunnel34952 = loadImage("scavi/tunnel_34952.png");
  PImage tunnel34959 = loadImage("scavi/tunnel_34959.png");
  PImage tunnel35016 = loadImage("scavi/tunnel_35016.png");
  PImage tunnel35023 = loadImage("scavi/tunnel_35023.png");
  PImage tunnel35048 = loadImage("scavi/tunnel_35048.png");
  PImage tunnel35055 = loadImage("scavi/tunnel_35055.png");
  PImage tunnel35976 = loadImage("scavi/tunnel_35976.png");
  PImage tunnel36047 = loadImage("scavi/tunnel_36047.png");
  PImage tunnel36448 = loadImage("scavi/tunnel_36448.png");
  PImage tunnel36488 = loadImage("scavi/tunnel_36488.png");
  PImage tunnel36584 = loadImage("scavi/tunnel_36584.png");
  PImage tunnel36591 = loadImage("scavi/tunnel_36591.png");
  PImage tunnel39321 = loadImage("scavi/tunnel_39321.png");
  PImage tunnel39327 = loadImage("scavi/tunnel_39327.png");
  PImage tunnel39417 = loadImage("scavi/tunnel_39417.png");
  PImage tunnel39423 = loadImage("scavi/tunnel_39423.png");
  PImage tunnel40857 = loadImage("scavi/tunnel_40857.png");
  PImage tunnel40953 = loadImage("scavi/tunnel_40953.png");
  PImage tunnel40959 = loadImage("scavi/tunnel_40959.png");
  PImage tunnel61440 = loadImage("scavi/tunnel_61440.png");
  PImage tunnel61455 = loadImage("scavi/tunnel_61455.png");
  PImage tunnel61713 = loadImage("scavi/tunnel_61713.png");
  PImage tunnel61727 = loadImage("scavi/tunnel_61727.png");
  PImage tunnel61952 = loadImage("scavi/tunnel_61952.png");
  PImage tunnel61984 = loadImage("scavi/tunnel_61984.png");
  PImage tunnel61999 = loadImage("scavi/tunnel_61999.png");
  PImage tunnel62225 = loadImage("scavi/tunnel_62225.png");
  PImage tunnel62257 = loadImage("scavi/tunnel_62257.png");
  PImage tunnel62271 = loadImage("scavi/tunnel_62271.png");
  PImage tunnel62464 = loadImage("scavi/tunnel_62464.png");
  PImage tunnel62528 = loadImage("scavi/tunnel_62528.png");
  PImage tunnel62543 = loadImage("scavi/tunnel_62543.png");
  PImage tunnel62972 = loadImage("scavi/tunnel_62972.png");
  PImage tunnel63072 = loadImage("scavi/tunnel_63072.png");
  PImage tunnel63087 = loadImage("scavi/tunnel_63087.png");
  PImage tunnel63249 = loadImage("scavi/tunnel_63249.png");
  PImage tunnel63345 = loadImage("scavi/tunnel_63345.png");
  PImage tunnel63359 = loadImage("scavi/tunnel_63359.png");
  PImage tunnel63624 = loadImage("scavi/tunnel_63624.png");
  PImage tunnel63631 = loadImage("scavi/tunnel_63631.png");
  PImage tunnel63897 = loadImage("scavi/tunnel_63897.png");
  PImage tunnel64648 = loadImage("scavi/tunnel_64648.png");
  PImage tunnel64712 = loadImage("scavi/tunnel_64712.png");
  PImage tunnel64719 = loadImage("scavi/tunnel_64719.png");
  PImage tunnel65160 = loadImage("scavi/tunnel_65160.png");
  PImage tunnel65256 = loadImage("scavi/tunnel_65256.png");
  PImage tunnel65263 = loadImage("scavi/tunnel_65263.png");
  PImage tunnel65433 = loadImage("scavi/tunnel_65433.png");
  PImage tunnel65529 = loadImage("scavi/tunnel_65529.png");

}
