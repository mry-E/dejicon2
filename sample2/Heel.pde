class Heel {
  float x, y, r;
  float angle;
  float sizeY = 0.0;
  Heel() {
    x = 200;
    y = 50;
    r = 50;
    angle = 0;
  }
  
  void display() {
    ellipse(x, y+sizeY, r, r);
    x -= dx;
  }
  
  void update(){
    angle += 0.02;
    sizeY = sin(angle)*10;
  }
}
