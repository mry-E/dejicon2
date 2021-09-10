int dx = 1;
int dy = 3;




Screen s;

int scene = 1;
PImage img,img2,img3;
float x =0, speed = 0.8;


Balloon b;
HP h;
Background back;


Heel o1;
Cloud o2;
Spine o3;

void setup() {
  size(800, 800);
  PFont font = createFont("Meiryo",50);
  textFont(font);
  o1 = new Heel();
  o2 = new Cloud();
  o3 = new Spine();
  b = new Balloon(width/8, height/2, 200);
  h = new HP();
  back = new Background();
}

void draw() {
  s = new Screen();
  switch(scene) {
    case 1:
      Start();
      break;
    case 2:
      Gameover();
      break;
    case 3:
      Clear();
      break;
    case 4:
      Game();
      break;
  }
  
}

void Start() {
  s.Start();
}

void Gameover() {
  s.End();
}

void Clear() {
  s.Clear();
}

void Game() {
  back.display();
  b.update();
  b.display();
  b.airVolDe();
  if(b.r < 10){
    b.airVolIn();
  }
  if(b.r > 500){
    b.balloonBreak();
  }
  
  h.update(b.r/200);
  h.display();
  
  o1.display();
  o1.update();
  o2.display();
  o3.display();
}


void keyPressed() {
  if (keyCode == UP) {
    b.move(0, -10, 0);
  }
  if (keyCode == DOWN) {
    b.move(0, 10, 0);
  }
  
  if(key == 'r') {
    scene = 1;
  }
  if(key == 's') {
    scene = 4;
  }
}

void keyReleased(){
  if (keyCode == RIGHT) {
    b.move(100, 0, 100);
  }
}
