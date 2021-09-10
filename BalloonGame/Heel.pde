class Heel {
  float x, y, r;
  PImage img;
  boolean isAtack = false;
  boolean isHeel = false;
  Heel(float x1,float y1) {
    x = x1;
    y = y1;
    r = 100;
    img = loadImage("image/kuukiire.png");
  }

  void display() {
    if (!isAtack) {
      //ellipse(x, y, r, r);
      image(img,x-r/2,y-r/2,r,r);
    }
  }

  void move() {
    x += -1;
  }
  
  void isAtackJudge(float bx,float by,float br){
    if(dist(x,y,bx,by) < r/2+br/2){
      isAtack = true;
      isHeel = true;
      x = -100;
    }
  } 
}
