class Sizuku {
  float x, y, r;
  int A;
  float dy = 2.0;

  Sizuku() {
    x = width/2;
    y = height/2;
    r = 90;
    A = 5;
  }

  void display() {
    strokeWeight(2);
    fill(255);
    ellipse(x+10, y-30, 10, 25);
    y += dy;
  }
  
  void drawDrop() {
    fill(100, 100, 255);
    pushMatrix();
    translate(x, y);
    rotate(radians(-90));
    beginShape();
    for (int theta = 0; theta < 360; theta++) {
      float R = r / (A * sin(radians(theta)/2)+1);
      vertex(R * cos(radians(theta)), R * sin(radians(theta)));
    }
    endShape(CLOSE);
    popMatrix();
  }
}
