class Cloud {
  float x, y, len, val,speed;
  boolean isAtack = false;
  int isBound = 0;
  PImage img;
  
  Cloud(float x1,float y1,float len1,float val1,float speed1) {
    x = x1;
    y = y1;
    len = len1;
    val = val1;
    speed = speed1;
    img = loadImage("image/kumo.png");
  }

  void display() {
    if (!isAtack) {
      
      //rect(x, y, len, val);
      image(img,x-10,y-20,len+20,val+40);
    }
  }

  void update() {
    x -= speed;
  }

  void isAtackJudge(float bx, float by, float br) {
    if (!isAtack) {
      if (bx < x && bx+br/2 > x && by > y && by < y+val) {
        isAtack = true;
        isBound = 1;
        x = -width;
      }else if(by > y+val && by-br/2 < y+val && bx > x && bx < x+len){
        isAtack = true;
        isBound = 2;
        x = -width;
      }else if(by < y && by+br/2 > y && bx > x && bx < x+len){
        isAtack = true;
        isBound = 3;
        x = -width;
      }
    }
  }
}
