
import java.util.Scanner;

// 9:16 aspect ratio
// 540x960

final int WINDOW_X = 540;
final int WINDOW_Y = 960;
final int FIELD_DIM = 500;
final int FIELD_X = (WINDOW_X - FIELD_DIM) / 2;
final int FIELD_Y = (WINDOW_Y - FIELD_DIM) / 2;

// FIELD_DIM = 2 * FIELD_BORDER + 6 * FIELD_SPACE + 5 * FIELD_GAP 
final int FIELD_BORDER = 10;
final int FIELD_SPACE = 75;
final int FIELD_GAP = 6;

final int WDIM = 6; // world dim
final int WLEN = WDIM * WDIM;

PImage img_background;
PImage img_textureP;
PImage img_textureX;
PImage img_textureY;

PImage img_p;
PImage img_x2;
PImage img_x3;
PImage img_y2;
PImage img_y3;

PImage img_po;
PImage img_x2o;
PImage img_x3o;
PImage img_y2o;
PImage img_y3o;

final char[] world = new char[WLEN];

void setup() {
  size(WINDOW_X, WINDOW_Y);
  img_background = loadImage("images/background.png");
  img_textureP = loadImage("images/texture_player.png");
  img_textureX = loadImage("images/texture_horizontal.png");
  img_textureY = loadImage("images/texture_vertical.png");
  
  img_p = mkTexture(img_textureP, 2, 1);
  img_x2 = mkTexture(img_textureX, 2, 1);
  img_x3 = mkTexture(img_textureX, 3, 1);
  img_y2 = mkTexture(img_textureY, 1, 2);
  img_y3 = mkTexture(img_textureY, 1, 3);
  
  img_po = mkOutline(#FF0000, 2, 1);
  img_x2o = mkOutline(#0000FF, 2, 1);
  img_x3o = mkOutline(#0000FF, 3, 1);
  img_y2o = mkOutline(#0000FF, 1, 2);
  img_y3o = mkOutline(#0000FF, 1, 3);

  String worldstr = loadStrings("world.data")[0]; // TODO load multiple worlds and check length
  for (int i = 0; i < WLEN; i++) {
    world[i] = worldstr.charAt(i);
  }
}

void draw() {
  image(img_background,0,0);
  draw_grid();
  draw_field();
  draw_blocks();
}







