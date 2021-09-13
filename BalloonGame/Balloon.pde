class Balloon {
  float x, y, r, maxR;
  float angle;
  float sizeY = 0.0;
  float sizeStepY = 0.5;
  boolean isOverHeel = false;
  Balloon(float x1, float y1, float r1) {
    x = x1;
    y = y1;
    r = r1;
    maxR = 300;
    angle = 0;
  }

  void display() {
    if (!isOverHeel) {
      stroke(0);
      line(x, y+sizeY, x, y+sizeY+r/2+25);
      noStroke();
      fill(255, 0, 0);
      ellipse(x, y+sizeY, r, r);
      triangle(x, y+sizeY+r/2-10, x-10, y+sizeY+r/2+10, x+10, y+sizeY+r/2+10);
    }
  }

  void update(float rPercent) {
    if (!isOverHeel) {
      angle += 0.06;
      sizeY = sin(angle)*10;
      if (rPercent > 0.5) {
        y -= sizeStepY;
      } else {
        y += sizeStepY;
      }
      r -= 0.1;
    }
  }

  void move(float stepX, float stepY, float stepR) {
    x += stepX;
    y += stepY;
    r -= stepR;
  }

  void airVolIn() {
    r += 25;
  }
}
