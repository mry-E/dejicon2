class Cloud {
  float x, y, r;
  Cloud() {
    x = 100;
    y = 100;
    r = 50;
  }
  
  void display() {
    rect(x, y, r, r*4);
    x -= dx;
  }
}
