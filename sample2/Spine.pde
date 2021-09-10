class Spine {
  float x1, y1, x2, y2, x3, y3;
  
  Spine() {
    x1 = 300;
    y1 = 250;
    x2 = 100;
    y2 = 275;
    x3 = 300;
    y3 = 300;
  }
  
  void display() {
    triangle(x1, y1, x2, y2, x3, y3);
    x1 -= dx;
    x2 -= dx;
    x3 -= dx;
  }
}
