
char piece = '\0';
boolean pieceHold = false;
int gridX_min = 0;
int gridX_max = 0;
int gridY_min = 0;
int gridY_max = 0;
int x_min = 0;
int x_max = 0;
int y_min = 0;
int y_max = 0;

void mousePressed() {
  //println("" + mouseXGrid() + "," + mouseYGrid());
  if (!pieceHold) {
    
  }
}

void mouseReleased() {
  if (pieceHold) {
    
  }
}

int mouseXGrid() {
  int x = mouseX;
  for (int i = 0; i < WDIM - 1; i++) {
    if (x <= gridX(i + 1) + FIELD_GAP / 2) {
      return i;
    }
  }
  return WDIM - 1;
}

int mouseYGrid() {
  int y = mouseY;
  for (int i = 0; i < WDIM - 1; i++) {
    if (y <= gridY(i + 1) + FIELD_GAP / 2) {
      return i;
    }
  }
  return WDIM - 1;
}

Piece getPiece(int gx, int gy) {
  
}

class Piece {
  char c;
  int gx, gy;
  
  Piece(char c, int gx, int gy) { this.c = c; this.gx = gx; this.gy = gy; }
}
