class Tori {
  float x1, y1, x2, y2, x3, y3, speed;
  boolean isAtack = false;
  boolean isTori = false;
  PImage img;
  
  Tori(float X1, float Y1, float X2, float Y2, float X3, float Y3, float speed1) {
    x1 = X1;
    y1 = Y1;
    x2 = X2;
    y2 = Y2;
    x3 = X3;
    y3 = Y3;
    speed = speed1;
    img = loadImage("image/tori.png");
  }
  
  void display() {
    if(!isAtack) {
      fill(0);
      //triangle(x1, y1, x2, y2, x3, y3);
      image(img, x2, y1, 40, 40);
    }
  }
  
  void update() {
    x1 -= speed;
    x2 -= speed;
    x3 -= speed;
  }
  
  void isAtackJudge(float bx, float by, float br) {
    if(!isAtack) {
      if(dist(x1, y1, bx, by) < br || dist(x2, y2, bx, by) < br || dist(x3, y3, bx, by) < br) {
        isAtack = true;
        isTori = true;
      }
    }
  }
}