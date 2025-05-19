Movie videoIniziale;

Minim minim;
AudioPlayer gameStarted, fruitGrabbed, roundClear, digDugWalking, monsterEscaped, digDugWalkingFast, monsterTouchingDigDug, deathDigDug, gameover, monsterRunningAway, monsterSquashed, monsterBlownOut, rockDestruction, rockFalling, fygarFiring, harpoon, pumping, monsterMoving;

PFont font;

int coloreLivello;
PImage menu;
PImage[][] terreno = new PImage[3][4];
PImage tunnel0, tunnel15, tunnel47, tunnel79, tunnel111, tunnel559, tunnel1103, tunnel1647, tunnel4369, tunnel4383,
  tunnel4401, tunnel4415, tunnel4465, tunnel4479, tunnel4881, tunnel4913, tunnel4927, tunnel5905, tunnel6001, tunnel6015,
  tunnel34952, tunnel34959, tunnel35016, tunnel35023, tunnel35048, tunnel35055, tunnel35976, tunnel36047, tunnel36048, tunnel36488,
  tunnel36584, tunnel36591, tunnel39321, tunnel39327, tunnel39417, tunnel39423, tunnel40857, tunnel40953, tunnel40959, tunnel61440,
  tunnel61455, tunnel61713, tunnel61727, tunnel61952, tunnel61984, tunnel61999, tunnel62225, tunnel62257, tunnel62271, tunnel62464,
  tunnel62528, tunnel62543, tunnel62972, tunnel63072, tunnel63087, tunnel63249, tunnel63345, tunnel63359, tunnel63624, tunnel63631,
  tunnel63897, tunnel64648, tunnel64712, tunnel64719, tunnel65160, tunnel65256, tunnel65263, tunnel65433, tunnel65529;
PImage[][] animazionePlayerScavo = new PImage[2][6];
PImage[][] animazionePlayerPompata = new PImage[2][6];
PImage[][] animazionePlayerCamminata = new PImage[2][6];
PImage rocciaFerma;
PImage[] rocciaCadente = new PImage[3];
PImage fiore;
PImage[] fiore10 = new PImage[2];
PImage[][] animazionePooka = new PImage[2][2];
PImage[][] animazionePookaGonfiato = new PImage[3][2];
PImage[] animazionePookaFantasma = new PImage[2];
PImage[] frutti = new PImage[10];
PImage[][] pompa = new PImage[2][6];
PImage[] fygarFantasma = new PImage[2];
PImage[][] fygarGonfiore = new PImage[3][2];
PImage[][] fygarFuoco = new PImage[3][2];
PImage[][] fygarAnimazione = new PImage[2][2];
PImage[] fygarAttacco = new PImage[2];
PImage[] fygarSchiacciato = new PImage[2];
PImage[] pookaSchiacciato = new PImage[2];
PImage[] playerSchiacciato = new PImage[2];


void inizializzaAsset(){
  font = createFont("font.ttf", 32);
  rocciaFerma= loadImage("generali/roccia/roccia.png");
  for(int i=0; i<3; i++){
    rocciaCadente[i] = loadImage("generali/roccia/rocciaCadente"+(i+1)+".png");
  }
  for(int i=0; i<3; i++){
    for(int j=0; j<4; j++){
      terreno[i][j] = loadImage("terreno/terreno"+(i+1)+""+(j+1)+".png");
    }
  }
  
  pompa[0][0] = loadImage("player/pompa/tuboPompa1.png");
  pompa[1][0] = loadImage("player/pompa/puntaPompa1.png");
  pompa[0][1] = loadImage("player/pompa/tuboPompa2.png");
  pompa[1][1] = loadImage("player/pompa/puntaPompa2.png");
  pompa[0][2] = loadImage("player/pompa/tuboPompa3.png");
  pompa[1][2] = loadImage("player/pompa/puntaPompa3.png");
  pompa[0][3] = loadImage("player/pompa/tuboPompa4.png");
  pompa[1][3] = loadImage("player/pompa/puntaPompa4.png");
  pompa[0][4] = loadImage("player/pompa/tuboPompa5.png");
  pompa[1][4] = loadImage("player/pompa/puntaPompa5.png");
  pompa[0][5] = loadImage("player/pompa/tuboPompa6.png");
  pompa[1][5] = loadImage("player/pompa/puntaPompa6.png");
  
  animazionePlayerScavo[0][0] = loadImage("player/ScavoAnimazione/spriteScavaggio1.png");
  animazionePlayerScavo[1][0] = loadImage("player/ScavoAnimazione/spriteScavaggioAnimato1.png");
  animazionePlayerScavo[0][1] = loadImage("player/ScavoAnimazione/spriteScavaggio2.png");
  animazionePlayerScavo[1][1] = loadImage("player/ScavoAnimazione/spriteScavaggioAnimato2.png");
  animazionePlayerScavo[0][2] = loadImage("player/ScavoAnimazione/spriteScavaggio3.png");
  animazionePlayerScavo[1][2] = loadImage("player/ScavoAnimazione/spriteScavaggioAnimato3.png");
  animazionePlayerScavo[0][3] = loadImage("player/ScavoAnimazione/spriteScavaggio4.png");
  animazionePlayerScavo[1][3] = loadImage("player/ScavoAnimazione/spriteScavaggioAnimato4.png");
  animazionePlayerScavo[0][4] = loadImage("player/ScavoAnimazione/spriteScavaggio5.png");
  animazionePlayerScavo[1][4] = loadImage("player/ScavoAnimazione/spriteScavaggioAnimato5.png");
  animazionePlayerScavo[0][5] = loadImage("player/ScavoAnimazione/spriteScavaggio6.png");
  animazionePlayerScavo[1][5] = loadImage("player/ScavoAnimazione/spriteScavaggioAnimato6.png");
  
  fygarFuoco[0][0] = loadImage("cpu/fygar/fuoco/fygarFuoco1L.png");
  fygarFuoco[1][0] = loadImage("cpu/fygar/fuoco/fygarFuoco2L.png");
  fygarFuoco[2][0] = loadImage("cpu/fygar/fuoco/fygarFuoco3L.png");
  fygarFuoco[0][1] = loadImage("cpu/fygar/fuoco/fygarFuoco1R.png");
  fygarFuoco[1][1] = loadImage("cpu/fygar/fuoco/fygarFuoco2R.png");
  fygarFuoco[2][1] = loadImage("cpu/fygar/fuoco/fygarFuoco3R.png");
  
  fygarAttacco[0] = loadImage("cpu/fygar/fygarPreparazioneR.png");
  fygarAttacco[1] = loadImage("cpu/fygar/fygarPreparazioneL.png");
  fygarAnimazione[0][0] = loadImage("cpu/fygar/fygarL.png");
  fygarAnimazione[1][0] = loadImage("cpu/fygar/fygarR.png");
  fygarAnimazione[0][1] = loadImage("cpu/fygar/fygarAnimazioneL.png");
  fygarAnimazione[1][1] = loadImage("cpu/fygar/fygarAnimazioneR.png");
  fygarGonfiore[0][0] = loadImage("cpu/fygar/fygarGonfiore1L.png");
  fygarGonfiore[1][0] = loadImage("cpu/fygar/fygarGonfiore2L.png");
  fygarGonfiore[2][0] = loadImage("cpu/fygar/fygarGonfiore3L.png");
  fygarGonfiore[0][1] = loadImage("cpu/fygar/fygarGonfiore1R.png");
  fygarGonfiore[1][1] = loadImage("cpu/fygar/fygarGonfiore2R.png");
  fygarGonfiore[2][1] = loadImage("cpu/fygar/fygarGonfiore3R.png");
  fygarFantasma[0] = loadImage("cpu/fygar/fantasma/fygarFantasma1.png");
  fygarFantasma[1] = loadImage("cpu/fygar/fantasma/fygarFantasma2.png");
  
  animazionePlayerPompata[0][0] = loadImage("player/pompata/Pompata11.png");
  animazionePlayerPompata[1][0] = loadImage("player/pompata/Pompata21.png");
  animazionePlayerPompata[0][1] = loadImage("player/pompata/Pompata12.png");
  animazionePlayerPompata[1][1] = loadImage("player/pompata/Pompata22.png");
  animazionePlayerPompata[0][2] = loadImage("player/pompata/Pompata13.png");
  animazionePlayerPompata[1][2] = loadImage("player/pompata/Pompata23.png");
  animazionePlayerPompata[0][3] = loadImage("player/pompata/Pompata14.png");
  animazionePlayerPompata[1][3] = loadImage("player/pompata/Pompata24.png");
  animazionePlayerPompata[0][4] = loadImage("player/pompata/Pompata15.png");
  animazionePlayerPompata[1][4] = loadImage("player/pompata/Pompata25.png");
  animazionePlayerPompata[0][5] = loadImage("player/pompata/Pompata16.png");
  animazionePlayerPompata[1][5] = loadImage("player/pompata/Pompata26.png");
  
  animazionePlayerCamminata[0][0] = loadImage("player/CamminataAnimazione/camminata1.png");
  animazionePlayerCamminata[1][0] = loadImage("player/CamminataAnimazione/camminataAnimata1.png");
  animazionePlayerCamminata[0][1] = loadImage("player/CamminataAnimazione/camminata2.png");
  animazionePlayerCamminata[1][1] = loadImage("player/CamminataAnimazione/camminataAnimata2.png");
  animazionePlayerCamminata[0][2] = loadImage("player/CamminataAnimazione/camminata3.png");
  animazionePlayerCamminata[1][2] = loadImage("player/CamminataAnimazione/camminataAnimata3.png");
  animazionePlayerCamminata[0][3] = loadImage("player/CamminataAnimazione/camminata4.png");
  animazionePlayerCamminata[1][3] = loadImage("player/CamminataAnimazione/camminataAnimata4.png");
  animazionePlayerCamminata[0][4] = loadImage("player/CamminataAnimazione/camminata5.png");
  animazionePlayerCamminata[1][4] = loadImage("player/CamminataAnimazione/camminataAnimata5.png");
  animazionePlayerCamminata[0][5] = loadImage("player/CamminataAnimazione/camminata6.png");
  animazionePlayerCamminata[1][5] = loadImage("player/CamminataAnimazione/camminataAnimata6.png");
  
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
  
  menu = loadImage("digdug.png");
  
  frutti[0] = loadImage("generali/zucca.png");
  frutti[1] = loadImage("generali/ananas.png");
  frutti[2] = loadImage("generali/carota.png");
  frutti[3] = loadImage("generali/cetriolo.png");
  frutti[4] = loadImage("generali/fioreraccogliere.png");
  frutti[5] = loadImage("generali/fungo.png");
  frutti[6] = loadImage("generali/melanzana.png");
  frutti[7] = loadImage("generali/peperone.png");
  frutti[8] = loadImage("generali/pomodoro.png");
  frutti[9] = loadImage("generali/ravanello.png");

  fiore = loadImage("generali/fiore.png");
  fiore10[0] = loadImage("generali/fiore101.png");
  fiore10[1] = loadImage("generali/fiore102.png");

  animazionePooka[0][0] = loadImage("cpu/pooka/pookaL.png");
  animazionePooka[1][0] = loadImage("cpu/pooka/pookaR.png");
  animazionePooka[0][1] = loadImage("cpu/pooka/pookaCamminaL.png");
  animazionePooka[1][1] = loadImage("cpu/pooka/pookaCamminaR.png");
  animazionePookaGonfiato[0][0] = loadImage("cpu/pooka/pookaGonfiore1L.png");
  animazionePookaGonfiato[1][0] = loadImage("cpu/pooka/pookaGonfiore2L.png");
  animazionePookaGonfiato[2][0] = loadImage("cpu/pooka/pookaGonfiore3L.png");
  animazionePookaGonfiato[0][1] = loadImage("cpu/pooka/pookaGonfiore1R.png");
  animazionePookaGonfiato[1][1] = loadImage("cpu/pooka/pookaGonfiore2R.png");
  animazionePookaGonfiato[2][1] = loadImage("cpu/pooka/pookaGonfiore3R.png");
  animazionePookaFantasma[0] = loadImage("cpu/pooka/fantasma/PookaFantasma1.png");
  animazionePookaFantasma[1] = loadImage("cpu/pooka/fantasma/PookaFantasma2.png");
  fygarSchiacciato[0] = loadImage("cpu/fygar/fygarSchiacciatoL.png");
  fygarSchiacciato[1] = loadImage("cpu/fygar/fygarSchiacciatoR.png");
  
  pookaSchiacciato[0] = loadImage("cpu/pooka/pookaSchiacciatoL.png");
  pookaSchiacciato[1] = loadImage("cpu/pooka/pookaSchiacciatoR.png");
  
  playerSchiacciato[0] = loadImage("player/Schiacciato/playerSchiacciatoL.png");
  playerSchiacciato[1] = loadImage("player/Schiacciato/playerSchiacciatoR.png");
  
  gameStarted = minim.loadFile("audio/gameStarted.mp3");
  fruitGrabbed = minim.loadFile("audio/fruitGrabbed.mp3");
  roundClear = minim.loadFile("audio/roundClear.mp3");
  digDugWalking = minim.loadFile("audio/digDugWalking.mp3");
  monsterEscaped = minim.loadFile("audio/monsterEscaped.mp3");
  digDugWalkingFast = minim.loadFile("audio/digDugWalkingFast.mp3");
  monsterTouchingDigDug = minim.loadFile("audio/monsterTouchingDigDug.mp3");
  deathDigDug = minim.loadFile("audio/deathDigDug.mp3");
  gameover = minim.loadFile("audio/gameover.mp3");
  monsterRunningAway = minim.loadFile("audio/monsterRunningAway.mp3");
  monsterSquashed = minim.loadFile("audio/monsterSquashed.mp3");
  monsterBlownOut = minim.loadFile("audio/monsterBlownOut.mp3");
  rockDestruction = minim.loadFile("audio/rockDestruction.mp3");
  rockFalling = minim.loadFile("audio/rockFalling.mp3");
  fygarFiring = minim.loadFile("audio/fygarFiring.mp3");
  harpoon = minim.loadFile("audio/harpoon.mp3");
  pumping = minim.loadFile("audio/pumping.mp3");
  monsterMoving = minim.loadFile("audio/monsterMoving.mp3");
  
  videoIniziale = new Movie(this, "videoIniziale.mp4");
}
