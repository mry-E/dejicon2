class Background {
  PImage img;
  float x =0, speed = 1;

  Background() {
    img = loadImage("image/sora.png");
  }

  void display() {
    x -= speed;
    image(img, x, 0);
    if (x<0) {
      for (int i=0; i<30; i++) {
        image(img, x+1000*i, 0);
      }
    }
    //saveFrame("frames/######.png");
  }
}