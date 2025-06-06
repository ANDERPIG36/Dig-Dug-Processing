int clock;
int tempoTesto;
int tempoFrutto=0;

int statoPlayer; // per gestire le animazioni

int direzionePlayer; // direzionePlayer

int frameDelay = 10; // cambia sprite ogni 10 frame
int currentFrame = (clock / frameDelay) % 2;
int dir;

boolean staScavando=false;
boolean isPlayerSchiacciato=false;
boolean playerFermo=true;

boolean ultimoMostro=false;

boolean partita = false;
int tempoVideo = 0;
int tempoPompa = 0;
int pompaggio; //0 schiacciato, 1 alzato
int timerPompaggio;

// mappa livello
int[][] mappa = new int[13][12];
//bit 0-15: terreno casella 0:vuoto 1:pieno
int[][] percorso = new int[13][12];
boolean[][] visitato = new boolean [13][12];

//matrice per la casella
boolean[][] scavo = new boolean[4][4];

//variabile temporanea per l'aggiornamento della casella
int casella;

//posizione del giocatore
int playerX, playerY;

//posizione del giocatore relativa alla casella
int playerSubX, playerSubY;

int direzionePlayerSalita = 1; //serve per gestire da che lato il player sale

//numero livello
int livello;
//i livelli sono in realtà dallo 0 al 99 che si ripetono fino al 256 in cui il gioco originale crasha
int coloreLivello;

//punteggio
int score;
//nel gioco originale il punteggio si ferma a 9.999.999 punti

//numero vite
int nVite;

int fineAttaccoX, fineAttaccoY, precedenteAttaccoX, precedenteAttaccoY;
boolean attaccoAvanzando=false;
boolean mostroGrabbato=false;
boolean staAttaccando=false;

int roccieCadute=0;

//ultimo movimento fatto dal giocatore e movimento da comando
int ultimaMossa, comandoMossa;
/*
1:su
2:giù
3:destra
4:sinista
*/

boolean inPartita;
boolean drawFrutto;

//x e y dove andranno disegnate le caselle della matrice 
int xStampa, yStampa;

int fioriGrandi,fioriPiccoli;

class Pooka {
  int Xiniziale, Yiniziale;
  int x, y;
  int subX, subY;
  int drawX, drawY;
  int gonfiore;
  int ultimaMossa;
  int ultimoArrivo;
  int nMosse;
  boolean spettro;
  boolean isPookaSchiacciato;
  boolean isGrabbed;
  boolean passatoDalVia;
  int stato;
  int tempoMorte;
  
  Pooka(int x, int y) {
    this.Xiniziale=x;
    this.Yiniziale=y;
    this.x = x;
    this.y = y;
    this.subX = 1;
    this.subY = 3;
    this.drawX = x*64;
    this.drawY = y*64;
    this.gonfiore = 0;
    this.nMosse = 0;
    this.spettro = false;
    this.isPookaSchiacciato = false;
    this.isGrabbed = false;
    this.passatoDalVia = false;
    this.stato = 0;
    this.tempoMorte=-1;
  }
}
ArrayList<Pooka> pooka = new ArrayList<Pooka>();

class Fygar{
  int Xiniziale, Yiniziale;
  int x, y;
  int subX, subY;
  int drawX, drawY;
  int gonfiore;
  int ultimaMossa;
  int ultimoArrivo;
  int nMosse;
  boolean spettro;
  boolean isShooting;
  boolean isFygarSchiacciato;
  boolean isGrabbed;
  boolean direzioneAttacco;
  boolean passatoDalVia;
  int stato;
  int tempoMorte;
  int statoAttacco;
  int clockAttacco;
  
  Fygar(int x, int y) {
    this.Xiniziale=x;
    this.Yiniziale=y;
    this.x = x;
    this.y = y;
    this.subX = 1;
    this.subY = 3;
    this.drawX = x*64;
    this.drawY = y*64;
    this.gonfiore = 0;
    this.nMosse=0;
    this.spettro = false;
    this.isShooting = false;
    this.isFygarSchiacciato = false;
    this.isGrabbed = false;
    this.passatoDalVia = false;
    this.stato = 0;
    this.tempoMorte=-1;
    this.statoAttacco=0;
    this.clockAttacco=0;
  }
}
ArrayList<Fygar> fygar = new ArrayList<Fygar>();

class Roccia{
  int x,y;
  int subY;
  boolean isFalling;
  int sbriciolamento;
  int tempoCaduta;
  
  Roccia(int x, int y) {
    this.x = x;
    this.y = y;
    this.isFalling = false;
    this.sbriciolamento = 0;
    this.subY = 0;
    this.tempoCaduta = 0;
  }
}
ArrayList<Roccia> roccia = new ArrayList<Roccia>();
