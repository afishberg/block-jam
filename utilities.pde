
// gridX, gridY:   pixel coordinate from a location in the world grid
// gridWH:         number of pixels a block takes given a width or height in grid squares

// worldX, worldY: grid coordinate from a world index
// worldIdx:       world index from grid coordinates

int gridX(int gx) { return FIELD_X + FIELD_BORDER + gx * (FIELD_SPACE + FIELD_GAP); }
int gridY(int gy) { return FIELD_Y + FIELD_BORDER + gy * (FIELD_SPACE + FIELD_GAP); }
int gridWH(int gwh) { return gwh * FIELD_SPACE + (gwh - 1) * FIELD_GAP; }

int worldX(int idx) { return idx % WDIM; }
int worldY(int idx) { return idx / WDIM; }
int worldIdx(int gx, int gy) { if (chkG(gx) && chkG(gy)) { return gx + WDIM * gy; } else { return -1; } }

int up(int gx, int gy) { return worldIdx(gx, gy - 1); }
int left(int gx, int gy) { return worldIdx(gx - 1, gy); }
int right(int gx, int gy) { return worldIdx(gx + 1, gy); }
int down(int gx, int gy) { return worldIdx(gx, gy + 1); }

int up(int idx) { return worldIdx(worldX(idx), worldY(idx) - 1); }
int left(int idx) { return worldIdx(worldX(idx) - 1, worldY(idx)); }
int right(int idx) { return worldIdx(worldX(idx) + 1, worldY(idx)); }
int down(int idx) { return worldIdx(worldX(idx), worldY(idx) + 1); }


boolean chkG(int g) { return (g >= 0) && (g < WDIM); } // checks that grid coordinate is within acceptable range 

int bound(int val, int low, int high) {
  if (val < low) {
    return low;
  } else if (val > high) {
    return high;
  } else {
    return val;
  }
}
