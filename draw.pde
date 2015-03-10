void draw_blocks() {
  for (int i = 0; i < world.length; i++) {
    draw_block(world[i], worldX(i), worldY(i));
  }
}

void draw_block(char c, int gx, int gy) {
  PImage imgb;
  PImage imgo;
  
  switch(c) {
    case 'p':
      imgb = img_p;
      imgo = img_po;
      break;
    case 'x':
      imgb = img_x2;
      imgo = img_x2o;
      break;
    case 'X':
      imgb = img_x3;
      imgo = img_x3o;
      break;
    case 'y':
      imgb = img_y2;
      imgo = img_y2o;
      break;
    case 'Y':
      imgb = img_y3;
      imgo = img_y3o;
      break;
    default:
      return;
  }
  
  int x = gridX(gx), y = gridY(gy);
  image(imgb, x, y);
  image(imgo, x, y);
}

void draw_field() {
  fill(color(64,64,64,255*3/4));
  stroke(#FFFFFF);
  strokeWeight(10);
  rect(FIELD_X,FIELD_Y,FIELD_DIM,FIELD_DIM,FIELD_BORDER);
  strokeWeight(5);
  stroke(#00AA00);
  line(
    gridX(5) + FIELD_SPACE + FIELD_BORDER,
    gridY(1) + FIELD_SPACE + FIELD_GAP,
    gridX(5) + FIELD_SPACE + FIELD_BORDER,
    gridY(2) + FIELD_SPACE 
  ); // end line
}

void draw_grid() {
  stroke(#FFFFFF);
  strokeWeight(1);
  
  int minX, maxX, stepX, minY, maxY, stepY;
  // horizontal lines
  minX = FIELD_X;
  maxX = FIELD_X + FIELD_DIM;
  stepX = FIELD_DIM;
  
  minY = FIELD_Y + FIELD_BORDER;
  maxY = FIELD_Y + FIELD_DIM - FIELD_BORDER;
  stepY = FIELD_GAP; // alternates
  
  for (int i = minY; i <= maxY; i += stepY) {
    line(minX, i, maxX, i);
    stepY = (stepY == FIELD_GAP ? FIELD_SPACE : FIELD_GAP);
  }
  
  // vertical lines
  minY = FIELD_Y;
  maxY = FIELD_Y + FIELD_DIM;
  stepY = FIELD_DIM;
  
  minX = FIELD_X + FIELD_BORDER;
  maxX = FIELD_X + FIELD_DIM - FIELD_BORDER;
  stepX = FIELD_GAP; // alternates
  
  for (int i = minX; i <= maxX; i += stepX) {
    line(i, minY, i, maxY);
    stepX = (stepX == FIELD_GAP ? FIELD_SPACE : FIELD_GAP);
  } 
}
