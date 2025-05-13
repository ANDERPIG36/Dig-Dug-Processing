int coloreLivello;
PImage[][] terreno = new PImage[3][4];
PImage tunnel0, tunnel15, tunnel47, tunnel79, tunnel111, tunnel559, tunnel1103, tunnel1647, tunnel4369, tunnel4383,
  tunnel4401, tunnel4415, tunnel4465, tunnel4479, tunnel4881, tunnel4913, tunnel4927, tunnel5905, tunnel6001, tunnel6015,
  tunnel34952, tunnel34959, tunnel35016, tunnel35023, tunnel35048, tunnel35055, tunnel35976, tunnel36047, tunnel36048, tunnel36488,
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
  
  tunnel0 = loadImage("scavi/tunnel_0.png");
  tunnel15 = loadImage("scavi/tunnel_15.png");
  tunnel47 = loadImage("scavi/tunnel_47.png");
  tunnel79 = loadImage("scavi/tunnel_79.png");
  tunnel111 = loadImage("scavi/tunnel_111.png");
  tunnel559 = loadImage("scavi/tunnel_559.png");
  tunnel1103 = loadImage("scavi/tunnel_1103.png");
  tunnel1647 = loadImage("scavi/tunnel_1647.png");
  tunnel4369 = loadImage("scavi/tunnel_4369.png");
  tunnel4383 = loadImage("scavi/tunnel_4383.png");
  tunnel4401 = loadImage("scavi/tunnel_4401.png");
  tunnel4415 = loadImage("scavi/tunnel_4415.png");
  tunnel4465 = loadImage("scavi/tunnel_4465.png");
  tunnel4479 = loadImage("scavi/tunnel_4479.png");
  tunnel4881 = loadImage("scavi/tunnel_4881.png");
  tunnel4913 = loadImage("scavi/tunnel_4913.png");
  tunnel4927 = loadImage("scavi/tunnel_4927.png");
  tunnel5905 = loadImage("scavi/tunnel_5905.png");
  tunnel6001 = loadImage("scavi/tunnel_6001.png");
  tunnel6015 = loadImage("scavi/tunnel_6015.png");
  tunnel34952 = loadImage("scavi/tunnel_34952.png");
  tunnel34959 = loadImage("scavi/tunnel_34959.png");
  tunnel35016 = loadImage("scavi/tunnel_35016.png");
  tunnel35023 = loadImage("scavi/tunnel_35023.png");
  tunnel35048 = loadImage("scavi/tunnel_35048.png");
  tunnel35055 = loadImage("scavi/tunnel_35055.png");
  tunnel35976 = loadImage("scavi/tunnel_35976.png");
  tunnel36047 = loadImage("scavi/tunnel_36047.png");
  tunnel36048 = loadImage("scavi/tunnel_36048.png");
  tunnel36488 = loadImage("scavi/tunnel_36488.png");
  tunnel36584 = loadImage("scavi/tunnel_36584.png");
  tunnel36591 = loadImage("scavi/tunnel_36591.png");
  tunnel39321 = loadImage("scavi/tunnel_39321.png");
  tunnel39327 = loadImage("scavi/tunnel_39327.png");
  tunnel39417 = loadImage("scavi/tunnel_39417.png");
  tunnel39423 = loadImage("scavi/tunnel_39423.png");
  tunnel40857 = loadImage("scavi/tunnel_40857.png");
  tunnel40953 = loadImage("scavi/tunnel_40953.png");
  tunnel40959 = loadImage("scavi/tunnel_40959.png");
  tunnel61440 = loadImage("scavi/tunnel_61440.png");
  tunnel61455 = loadImage("scavi/tunnel_61455.png");
  tunnel61713 = loadImage("scavi/tunnel_61713.png");
  tunnel61727 = loadImage("scavi/tunnel_61727.png");
  tunnel61952 = loadImage("scavi/tunnel_61952.png");
  tunnel61984 = loadImage("scavi/tunnel_61984.png");
  tunnel61999 = loadImage("scavi/tunnel_61999.png");
  tunnel62225 = loadImage("scavi/tunnel_62225.png");
  tunnel62257 = loadImage("scavi/tunnel_62257.png");
  tunnel62271 = loadImage("scavi/tunnel_62271.png");
  tunnel62464 = loadImage("scavi/tunnel_62464.png");
  tunnel62528 = loadImage("scavi/tunnel_62528.png");
  tunnel62543 = loadImage("scavi/tunnel_62543.png");
  tunnel62972 = loadImage("scavi/tunnel_62972.png");
  tunnel63072 = loadImage("scavi/tunnel_63072.png");
  tunnel63087 = loadImage("scavi/tunnel_63087.png");
  tunnel63249 = loadImage("scavi/tunnel_63249.png");
  tunnel63345 = loadImage("scavi/tunnel_63345.png");
  tunnel63359 = loadImage("scavi/tunnel_63359.png");
  tunnel63624 = loadImage("scavi/tunnel_63624.png");
  tunnel63631 = loadImage("scavi/tunnel_63631.png");
  tunnel63897 = loadImage("scavi/tunnel_63897.png");
  tunnel64648 = loadImage("scavi/tunnel_64648.png");
  tunnel64712 = loadImage("scavi/tunnel_64712.png");
  tunnel64719 = loadImage("scavi/tunnel_64719.png");
  tunnel65160 = loadImage("scavi/tunnel_65160.png");
  tunnel65256 = loadImage("scavi/tunnel_65256.png");
  tunnel65263 = loadImage("scavi/tunnel_65263.png");
  tunnel65433 = loadImage("scavi/tunnel_65433.png");
  tunnel65529 = loadImage("scavi/tunnel_65529.png");

}
