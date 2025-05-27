void move() {
  switch (comandoMossa) {
  case 0:
    playerFermo=true;
    break;
  case 1:
    if (isMacigno(playerX, playerY-1) || playerSubY>1) {
      if (playerY>0||playerSubY>0) {
        if (playerSubX==1) {
          playerSubY--;
          if (playerSubY<0) {
            playerSubY+= 4;
            playerY--;
          }
          ultimaMossa = comandoMossa;
        } else {
          if ((ultimaMossa==3&&(playerX<11||playerSubX<1)) && isMacigno(playerX, playerY-1) && isMacigno(playerX, playerY)) {
            playerSubX++;
            if (playerSubX>3) {
              playerSubX-= 4;
              playerX++;
            }
          } else if ((playerX>0||playerSubX>1) && isMacigno(playerX, playerY-1)) {
            playerSubX--;
            if (playerSubX<0) {
              playerSubX+= 4;
              playerX--;
            }
          }
        }
      }
      playerFermo=false;
    }
    break;
  case 2:
    if (isMacigno(playerX, playerY+1) || playerSubY<3) {
      if (playerY<12||playerSubY<1) {
        if (playerSubX==1) {
          playerSubY++;
          if (playerSubY>3) {
            playerSubY-= 4;
            playerY++;
          }
          ultimaMossa = comandoMossa;
        } else {
          if ((ultimaMossa==3&&(playerX<11||playerSubX<1)) && isMacigno(playerX, playerY+1) && isMacigno(playerX, playerY)) {
            playerSubX++;
            if (playerSubX>3) {
              playerSubX-= 4;
              playerX++;
            }
          } else if ((playerX>0||playerSubX>1) && isMacigno(playerX+1, playerY-1)) {
            playerSubX--;
            if (playerSubX<0) {
              playerSubX+= 4;
              playerX--;
            }
          }
        }
      }
      playerFermo=false;
    }
    break;
  case 3:
    if (isMacigno(playerX+1, playerY) || playerSubX<3) {
      if (playerX<11||playerSubX<1) {
        if (playerSubY==1) {
          playerSubX++;
          if (playerSubX>3) {
            playerSubX-= 4;
            playerX++;
          }
          ultimaMossa = comandoMossa;
        } else {
          if ((ultimaMossa==1&&(playerY>0||playerSubY>0)) && isMacigno(playerX+1, playerY)) {
            playerSubY--;
            if (playerSubY<0) {
              playerSubY+= 4;
              playerY--;
            }
          } else if ((playerY<12||playerSubY<1) && isMacigno(playerX+1, playerY) && isMacigno(playerX, playerY)) {
            playerSubY++;
            if (playerSubY>3) {
              playerSubY-= 4;
              playerY++;
            }
          }
        }
      }
      playerFermo=false;
    }
    break;
  case 4:
    if (isMacigno(playerX-1, playerY) || playerSubX>1) {
      if (playerX>0||playerSubX>1) {
        if (playerSubY==1) {
          playerSubX--;
          if (playerSubX<0) {
            playerSubX+= 4;
            playerX--;
          }
          ultimaMossa = comandoMossa;
        } else {
          if ((ultimaMossa==1&&(playerY>0||playerSubY>0)) && isMacigno(playerX-1, playerY)) {
            playerSubY--;
            if (playerSubY<0) {
              playerSubY+= 4;
              playerY--;
            }
          } else if ((playerY<12||playerSubY<1) && isMacigno(playerX-1, playerY) && isMacigno(playerX, playerY)) {
            playerSubY++;
            if (playerSubY>3) {
              playerSubY-= 4;
              playerY++;
            }
          }
        }
      }
      playerFermo=false;
    }
    break;
  }
}

void gestioneAttacco() {
  if (!mostroGrabbato) {
    if(clock%16==0){
      bordiAttacco();
      controlloAvanzamentoAttacco();
      attacco();
      bordiAttacco();
    }
  }
  if(!staAttaccando){
    fineAttaccoX=playerX;
    fineAttaccoY=playerY;
  }
}

void attacco() {
  int centroCasella = (1 << 5) | (1 << 6) | (1 << 9) | (1 << 10);
  
  if(attaccoAvanzando){  
    precedenteAttaccoX = fineAttaccoX;
    precedenteAttaccoY = fineAttaccoY;
  }

  switch (direzionePlayer) {
    case 0: // destra
      if (attaccoAvanzando) {
        if (fineAttaccoX + 1 <= 11 && (mappa[fineAttaccoY][fineAttaccoX + 1] & centroCasella) == 0 && fineAttaccoX - playerX < 4) {
          fineAttaccoX++;
        } else {
          attaccoAvanzando = false;
        }
      } else {
        if (fineAttaccoX > playerX) {
          fineAttaccoX--;
        }
      }
      break;

    case 1:
    case 4: // giù
      if (attaccoAvanzando) {
        if (fineAttaccoY + 1 <= 12 && (mappa[fineAttaccoY + 1][fineAttaccoX] & centroCasella) == 0 && fineAttaccoY - playerY < 4) {
          fineAttaccoY++;
        } else {
          attaccoAvanzando = false;
        }
      } else {
        if (fineAttaccoY > playerY) {
          fineAttaccoY--;
        }
      }
      break;

    case 2:
    case 5: // su
      if (attaccoAvanzando) {
        if (fineAttaccoY - 1 >= 0 && (mappa[fineAttaccoY - 1][fineAttaccoX] & centroCasella) == 0 && playerY - fineAttaccoY < 4) {
          fineAttaccoY--;
        } else {
          attaccoAvanzando = false;
        }
      } else {
        if (fineAttaccoY < playerY) {
          fineAttaccoY++;
        }
      }
      break;

    case 3: // sinistra
      if (attaccoAvanzando) {
        if (fineAttaccoX - 1 >= 0 && (mappa[fineAttaccoY][fineAttaccoX - 1] & centroCasella) == 0 && playerX - fineAttaccoX < 4) {
          fineAttaccoX--;
        } else {
          attaccoAvanzando = false;
        }
      } else {
        if (fineAttaccoX < playerX) {
          fineAttaccoX++;
        }
      }
      break;
  }

  if (fineAttaccoX == playerX && fineAttaccoY == playerY) {
    staAttaccando = false;
    mostroGrabbato = false;
  }
}

void pompaMostro() {
  for (Pooka p : pooka) {
    if (p.isGrabbed&&staAttaccando) {
      pumping.rewind();
      pumping.play();
      p.gonfiore++;
    }
  }

  for (Fygar f : fygar) {
    if (f.isGrabbed&&staAttaccando) {
      pumping.rewind();
      pumping.play();
      f.gonfiore++;
    }
  }
  tempoPompa=0;
}

void controlloAvanzamentoAttacco() {
  int centroCasella = (1 << 5) | (1 << 6) | (1 << 9) | (1 << 10);

  if (playerX < fineAttaccoX) {
    if (fineAttaccoX + 1 <= 11) {
      if ((mappa[fineAttaccoY][fineAttaccoX + 1] & centroCasella) != 0) {
        attaccoAvanzando = false;
      }
    }
    if (fineAttaccoX - playerX >= 4) {
      attaccoAvanzando = false;
    }
  }
  else if (playerX > fineAttaccoX) {
    if (fineAttaccoX - 1 >= 0) {
      if ((mappa[fineAttaccoY][fineAttaccoX - 1] & centroCasella) != 0) {
        attaccoAvanzando = false;
      }
    }
    if (playerX - fineAttaccoX >= 4) {
      attaccoAvanzando = false;
    }
  }
  else if (playerY < fineAttaccoY) {
    if (fineAttaccoY + 1 <= 12) {
      if ((mappa[fineAttaccoY + 1][fineAttaccoX] & centroCasella) != 0) {
        attaccoAvanzando = false;
      }
    }
    if (fineAttaccoY - playerY >= 4) {
      attaccoAvanzando = false;
    }
  }
  else if (playerY > fineAttaccoY) {
    if (fineAttaccoY - 1 >= 0) {
      if ((mappa[fineAttaccoY - 1][fineAttaccoX] & centroCasella) != 0) {
        attaccoAvanzando = false;
      }
    }
    if (playerY - fineAttaccoY >= 4) {
      attaccoAvanzando = false;
    }
  }
}

void bordiAttacco(){
  if(fineAttaccoX>11){
    fineAttaccoX=11;
  }
  if(fineAttaccoY>12){
    fineAttaccoY=12;
  }
  if(fineAttaccoX<0){
    fineAttaccoX=0;
  }
  if(fineAttaccoY<0){
    fineAttaccoY=0;
  }
}

boolean isMacigno(int xCasellaDopo, int yCasellaDopo) {
  for (Roccia r : roccia) {
    if (r.x==xCasellaDopo && r.y==yCasellaDopo && r.sbriciolamento!=-1) {
      return false;
    }
  }
  return true;
}
