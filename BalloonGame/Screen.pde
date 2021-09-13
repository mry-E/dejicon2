class Screen {
  int start=-1;
  int difflevel;
  float speed = 1;
  float x = 0;
  PImage img,img2,img3,img_boy;
  
  int scene=0;
  Screen() {
    PFont font = createFont("Meiryo",50);
    textFont(font);
    img = loadImage("image/sora_Loop.png");
    img2 = loadImage("image/gameover.png");
    img3 = loadImage("image/clear.jpg");  
    img_boy = loadImage("image/fusen_hanasu_boy.png");
  }

  void Start() {
    background(0);
    img.resize(width,height);
    x -= speed;
    image(img, x, 0);
    if (x<5) {
      for (int i=0; i<30; i++) {
        image(img, x+width*i, 0);
      }
    }
    
    image(img_boy,width*5/8,height/4);
    //saveFrame("frames/######.png");
    fill(255);
    textSize(32);
    textAlign(CENTER);
    text("「風の船」", width/2, 300);
    text("少年の大切な風船は飛んでしまった.....", width/2, height/2);
    
    
    
  }

  void End() {    
    background(255);
    img2.resize(width,height); 
    image(img2,x+40,0);
    fill(0);
    textSize(32);
    textAlign(CENTER);
    text("ゲームオーバー", width/2, 300);
    text("もう1度少年の元へ帰る", width/2, height/2);
  }
  
  void Clear() {
    
    img3.resize(width,height);
    background(img3);
    fill(255);
    textSize(32);
    textAlign(CENTER);
    text("ゲームクリア!", width/2, 300);
    text("少年に会うことができた",width/2, height/2);
  }
}
