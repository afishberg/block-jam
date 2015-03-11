
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
  // println(pieceAt(mouseXGrid(), mouseYGrid()));
  if (!pieceHold && mouseInGrid()) {
    Piece p = pieceAt(mouseXGrid(), mouseYGrid());
    if (p != null) { grabPiece(p); }
  }
}

void mouseReleased() {
  if (pieceHold) {
    dropPiece();
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

Piece pieceAt(int gx, int gy) {
  int idx = worldIdx(gx, gy);
  if (idx < 0) { return null; }  
  if (world[idx] != ' ') {
    return new Piece(world[idx], gx, gy);
  } else {
    idx = left(gx,gy);
    if (idx >= 0 && (world[idx] == 'p' || world[idx] == 'x' || world[idx] == 'X')) { return new Piece(world[idx], gx - 1, gy); }
    
    idx = left(left(gx,gy));
    if (idx >= 0 && world[idx] == 'X') { return new Piece(world[idx], gx - 2, gy); }
    
    idx = up(gx, gy);
    if (idx >= 0 && (world[idx] == 'y' || world[idx] == 'Y')) { return new Piece(world[idx], gx, gy - 1); }
    
    idx = up(up(gx,gy));
    if (idx >= 0 && world[idx] == 'Y') { return new Piece(world[idx], gx, gy - 2); }
  }
  return null;
}

boolean isOpen(int gx, int gy) {
  return chkG(gx) && chkG(gy) && (pieceAt(gx, gy) == null);
}

boolean canFit(char p, int gx, int gy) {
  switch (piece) {
    case 'p':
    case 'x':
      return isOpen(gx, gy) && isOpen(gx + 1, gy); 
    case 'X':
      return isOpen(gx, gy) && isOpen(gx + 1, gy) && isOpen(gx + 2, gy);
    case 'y':
      return isOpen(gx, gy) && isOpen(gx, gy + 1);
    case 'Y':
      return isOpen(gx, gy) && isOpen(gx, gy + 1) && isOpen(gx, gy + 2);
  }
  return (pieceAt(gx, gy) == null);
}

boolean mouseInGrid() {
  return (mouseX >= FIELD_X) && (mouseX < FIELD_X + FIELD_DIM) && (mouseY >= FIELD_Y) && (mouseX < FIELD_Y + FIELD_DIM); 
}

void grabPiece(Piece p) {
  piece = p.c;
  pieceHold = true;
  
  world[p.idx] = ' ';
  
  switch (piece) {
    case 'p':
    case 'x':
    case 'X':
      gridX_min = p.gx;
      while ( canFit(piece, gridX_min - 1, p.gy) ) { gridX_min--; };
      
      gridX_max = p.gx;
      while ( canFit(piece, gridX_max + 1, p.gy) ) { gridX_max++; };
    
      gridY_min = p.gy;
      gridY_max = p.gy;
      
      println("" + gridX_min + ", " + gridX_max);
      
      break;   
    
    case 'y':
    case 'Y':
      gridX_min = p.gx;
      gridX_max = p.gx;
      
      gridY_min = p.gy;
      while ( canFit(piece, p.gx, gridY_min - 1) ) { gridY_min--; };
      
      gridY_max = p.gy;
      while ( canFit(piece, p.gx, gridY_max + 1) ) { gridY_max++; };
      
      println("" + gridY_min + ", " + gridY_max);
      
      break;  
    
    
  }
  
  
//  int x_min = 0;
//  int x_max = 0;
//  int y_min = 0;
//  int y_max = 0;
}

void dropPiece() {
  pieceHold = false;
  int idx = worldIdx(
                      bound(mouseXGrid(), gridX_min, gridX_max),
                      bound(mouseYGrid(), gridY_min, gridY_max)
                    );
  world[idx] = piece;
}

class Piece {
  char c;
  int gx, gy;
  int idx;
  
  Piece(char c, int gx, int gy) { this.c = c; this.gx = gx; this.gy = gy; idx = worldIdx(gx, gy); }
  String toString() { return "" + c + " | " + gx + " | " + gy; }
}
