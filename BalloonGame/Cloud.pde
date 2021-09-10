class Cloud {
  float x, y, len, val;
  boolean isAtack = false;
  int isBound = 0;
  PImage img;
  Cloud(float x1,float y1,float len1,float val1) {
    x = x1;
    y = y1;
    len = len1;
    val = val1;
    img = loadImage("image/kumo.png");
  }

  void display() {
    if (!isAtack) {
      //rect(x, y, len, val);
      image(img,x,y,len,val);
    }
  }

  void update() {
    x += -1;
  }

  void isAtackJudge(float bx, float by, float br) {
    if (!isAtack) {
      if (bx+br/2 > x && by > y && by < y+val) {
        isAtack = true;
        isBound = 1;
        x = -100;
      }else if(by-br/2 < y+val && bx > x && bx < x+len){
        isAtack = true;
        isBound = 2;
        x = -100;
      }else if(by+br/2 < y && bx > x && bx < x+len){
        isAtack = true;
        isBound = 3;
        x = -100;
      }
    }
  }
}
