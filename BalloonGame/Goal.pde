class Goal {
  int x1,y1;
  int x2,y2;
  int size = 50;
  PImage img5;
  Goal() {
    x1 = width;
    y1 = height;
    x2 = width;
    y2 = 0;
    img5 = loadImage("image/sora_sss.png");
    img5.resize(img5.width*3/9, img5.height*3/9);
  }
  void display() {
    stroke(255);
    line(x1,y1,x2,y2);
    x1 -= 1;
    x2 -= 1;
    
    image(img5, x1, height/2);
    //img4 = loadImage("");
    //img.resize(size,size);
    //image(img4, x, y, size, size);
    
  } 
}
