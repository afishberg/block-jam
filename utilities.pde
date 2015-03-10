int gridX(int gx) { return FIELD_X + FIELD_BORDER + gx * (FIELD_SPACE + FIELD_GAP); }
int gridY(int gy) { return FIELD_Y + FIELD_BORDER + gy * (FIELD_SPACE + FIELD_GAP); }
int gridW(int gw) { return gw * FIELD_SPACE + (gw - 1) * FIELD_GAP; }
int gridH(int gh) { return gh * FIELD_SPACE + (gh - 1) * FIELD_GAP; }
int worldX(int wx) { return wx % WDIM; }
int worldY(int wy) { return wy / WDIM; }
