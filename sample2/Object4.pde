class object4 {
  float x1, y1, x2, y2, x3, y3, x4, y4;
  float X1, Y1, X2, Y2, X3, Y3, X4, Y4;
  
  object4() {
    x1 = 100;
    y1 = 400;
    x2 = 100;
    y2 = 450;
    x3 = 300;
    y3 = 550;
    x4 = 300;
    y4 = 500;
    X1 = 100;
    Y1 = 500;
    X2 = 100;
    Y2 = 550;
    X3 = 300;
    Y3 = 450;
    X4 = 300;
    Y4 = 400;
  }
  
  void display() {
    quad(x1, y1, x2, y2, x3, y3, x4, y4);
    quad(X1, Y1, X2, Y2, X3, Y3, X4, Y4);
    x1 -= dx;
    x2 -= dx;
    x3 -= dx;
    x4 -= dx;
    X1 -= dx;
    X2 -= dx;
    X3 -= dx;
    X4 -= dx;
  }
}
