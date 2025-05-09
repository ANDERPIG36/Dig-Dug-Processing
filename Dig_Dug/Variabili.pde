// mappa livello
int[][] mappa = new int[13][12];
/*
bit 0-15: terreno casella 0:vuoto 1:pieno


forse:
bit 16: macigno 0:non c'è 1:c'è
bit 17: Pooka 0:non c'è 1:c'è
bit 18: Fygar 0:non c'è 1:c'è
bit 19: player 0:non c'è 1:c'è
bit 20: fuoco
bit 21: frutto
*/

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

//x e y dove andranno disegnate le caselle della matrice 
int xStampa, yStampa;

class Pooka {
  int x, y;
  int gonfiore;
  boolean spettro;
}
Pooka[] pooka = new Pooka[10];

class Fygar{
  int x, y;
  int gonfiore; 
  boolean spettro;
  boolean isShooting;
}
Fygar[] fygar = new Fygar[10];

class Roccia{
  int x,y;
  boolean isFalling;
  int sbriciolamento;
}
Roccia[] roccia = new Roccia[10];

void inizializzaImmagini(){

}
