void keyPressed() {
  switch (keyCode) {
    case UP:
      comandoMossa=1;
      break;
    case DOWN:
      comandoMossa=2;
      break;
    case RIGHT:
      comandoMossa=3;
      break;
    case LEFT:
      comandoMossa=4;
      break;
  }
}

void keyReleased() {
  switch (keyCode) {
    case UP:
      comandoMossa=0;
      break;
    case DOWN:
      comandoMossa=0;
      break;
    case RIGHT:
      comandoMossa=0;
      break;
    case LEFT:
      comandoMossa=0;
      break;
  }
}
