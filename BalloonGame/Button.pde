class Button {
  float x, y;
  float sizeX, sizeY;
  int state;

  float nb;
  float sb;
  float pb;

  String str;

  Button(float x, float y, float sizeX, float sizeY, String str) {
    this.x=x-sizeX/2;
    this.y=y+sizeY/2;
    this.sizeX=sizeX;
    this.sizeY=sizeY;
    this.str=str;

    nb=1; //normalBrightness
    sb=0.8; //selectBrightness
    pb=0.6; //pushBrightness
  }

  void run() {
    rogic();
    display();
  }

  void display() {
    noStroke();
    changeColor();
    rect(x, y, sizeX, sizeY);

    fill(0, 0, 0);
    textSize(30);
    textAlign(CENTER);
    text(str, x+sizeX/2, y+sizeY/2+10);
  }

  void rogic() {
    state=checkState();
  }

  //===================================================================
  boolean isPush() {
    if (checkState()==2) return true;
    return false;
  }

  int checkState() {
    if (!checkInMouse()) return 0;
    if (!mousePressed) return 1;
    return 2;
  }

  boolean checkInMouse() {
    if (mouseX>x&&mouseX<x+sizeX) {
      if (mouseY>y&&mouseY<y+sizeY) {
        return true;
      }
    }
    return false;
  }

  void changeColor() {
    switch(state) {
    case 0:
      fill(0,255,0,255*nb);
      break;

    case 1:
      fill(0,255,0,255*sb);
      break;

    case 2:
      fill(0,255,0,255*pb);
      break;

    default:
      fill(0, 255, 0);
      break;
    }
  }
}
