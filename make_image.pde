PImage mkTexture(PImage img, int gw, int gh) {
  int w = gridWH(gw);
  int h = gridWH(gh);
  
  int randX = (int)random(img.width - w);
  int randY = (int)random(img.height - h);
  
  PImage maskedTexture = img.get(randX, randY, w, h);
  maskedTexture.mask(mkMask(gw,gh));
  
  return maskedTexture;
}

PImage mkMask(int gw, int gh) {
  int w = gridWH(gw);
  int h = gridWH(gh);
  
  PGraphics pg = createGraphics(w, h);
  pg.beginDraw();
  pg.fill(color(255,255,255,255));
  //pg.noStroke();
  pg.strokeWeight(3);
  pg.rect(2,2,w-4,h-4,10);
  pg.endDraw();
  
  return pg;
}

PImage mkOutline(color c, int gw, int gh) {
  int w = gridWH(gw);
  int h = gridWH(gh);
  
  PGraphics pg = createGraphics(w, h);
  pg.beginDraw();
  //pg.fill(color(255,255,255,255));
  pg.noFill();
  //pg.noStroke();
  pg.stroke(c);
  pg.strokeWeight(3); // TODO hardcoded
  pg.rect(2,2,w-4,h-4,10); // TODO hardcoded
  pg.endDraw();
  
  return pg;
}
