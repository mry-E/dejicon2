class Screen {
  int start=-1;
  int difflevel;
  Screen() {
  }

  void Start() {
    img = loadImage("sora2.jpg");
    background(0);
    x -= speed;
    image(img, x, 0);
    if (x<5) {
      for (int i=0; i<30; i++) {
        image(img, x+1000*i, 0);
      }
    }
    //saveFrame("frames/######.png");
    fill(255);
    textSize(32);
    textAlign(CENTER);
    text("「風の船」", width/2, 300);
    text("少年の大切な風船は飛んでしまった.....", width/2, height/2);
    text("Sを押してね",width*2/3,height*2/3);
  }

  void End() {
    img2 = loadImage("gameover.png");
    background(255);
    image(img2,0,0);
    
    fill(0);
    textSize(32);
    textAlign(CENTER);
    text("ゲームオーバー", width/2, 300);
    text("もう1度少年の元へ帰る", width/2, height/2);
    text("Rを押してね",width*2/3,height*2/3);
  }
  
  void Clear() {
    img3 = loadImage("clear.jpg");
    img3.resize(width,height);
    background(img3);
    fill(255);
    textSize(32);
    textAlign(CENTER);
    text("ゲームクリア!", width/2, 300);
    text("少年に会うことができた",width/2, height/2);
    text("Rを押してね",width*2/3,height*2/3);
  }
}
