class Balloon {
  float x, y, r,maxR;
  float angle;
  float sizeY = 0.0;
  float sizeStepY = 0.1;
  Balloon(float x1, float y1, float r1) {
    x = x1;
    y = y1;
    r = r1;
    angle = 0;
    maxR = 300;
  }
  
  void display() {
    stroke(0);
    line(x,y+sizeY,x,y+sizeY+r/2+25);
    noStroke();
    fill(0,0,255);
    ellipse(x, y+sizeY, r, r);
    triangle(x,y+sizeY+r/2-10,x-10,y+sizeY+r/2+10,x+10,y+sizeY+r/2+10);    
  }
  
  void update(){
    angle += 0.06;
    sizeY = sin(angle)*10;
    if(r > maxR/2){
      y -= sizeStepY;
    }else{
      y += sizeStepY;
    }
  }
  
  void move(float stepX, float stepY, float stepR) {
    x += stepX;
    y += stepY;
    r -= stepR;
  }

  void airVolDe() {
    r -= 0.1;
  }
  
  void airVolIn(){
    r += 50;
  }
  
  void balloonBreak(){
    r = 0;
  }
}
