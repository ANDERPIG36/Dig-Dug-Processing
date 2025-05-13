// mappa livello
int[][] mappa = new int[13][12];
//bit 0-15: terreno casella 0:vuoto 1:pieno

//matrice per la casella
boolean[][] scavo = new boolean[4][4];

//variabile temporanea per l'aggiornamento della casella
int casella;

//posizione del giocatore
int playerX, playerY;

//posizione del giocatore relativa alla casella
int playerSubX, playerSubY;

//numero livello
int livello=0;
//i livelli sono in realtà dallo 0 al 99 che si ripetono fino al 256 in cui il gioco originale crasha

//punteggio
int score=0;
//nel gioco originale il punteggio si ferma a 9.999.999 punti

//numero vite
int nVite=3;

//ultimo movimento fatto dal giocatore e movimento da comando
int ultimaMossa, comandoMossa;
/*
1:su
2:giù
3:destra
4:sinista
*/

boolean inPartita;

//x e y dove andranno disegnate le caselle della matrice 
int xStampa, yStampa;

class Pooka {
  int x, y;
  int subX, subY;
  int gonfiore;
  boolean spettro;
  int stato;
  
  Pooka(int x, int y) {
    this.x = x;
    this.y = y;
    this.subX = 1;
    this.subY = 3;
    this.gonfiore = 0;
    this.spettro = false;
    this.stato = 0;
  }
}
ArrayList<Pooka> pooka = new ArrayList<Pooka>();

class Fygar{
  int x, y;
  int subX, subY;
  int gonfiore; 
  boolean spettro;
  boolean isShooting;
  int stato;
  
  Fygar(int x, int y) {
    this.x = x;
    this.y = y;
    this.subX = 1;
    this.subY = 3;
    this.gonfiore = 0;
    this.spettro = false;
    this.isShooting = false;
    this.stato = 0;
  }
}
ArrayList<Fygar> fygar = new ArrayList<Fygar>();

class Roccia{
  int x,y;
  int subX, subY;
  boolean isFalling;
  int sbriciolamento;
  
  Roccia(int x, int y) {
    this.x = x;
    this.y = y;
    this.isFalling = false;
    this.sbriciolamento = 0;
    this.subX = 1;
    this.subY = 3;
  }
}
ArrayList<Roccia> roccia = new ArrayList<Roccia>();
