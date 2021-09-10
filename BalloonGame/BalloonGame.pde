Screen s;

int scene = 1;
float x =0, speed = 0.8;
float rMax = 200;
PImage img;
int count = 0;
Balloon b;
HP h;
Background back;
Heel []heelOb = new Heel[5];
Cloud []cloudOb = new Cloud[5];

void setup() {
  size(1200, 800);
  img  = loadImage("image/haretu.png");
  s = new Screen();
  b = new Balloon(width/8, height/2, rMax);
  h = new HP();
  back = new Background();
  for (int i = 0; i < 5; i++) {
    heelOb[i] = new Heel(random(width/2, width*3/4)*(i+1), random(125, height-125));
    cloudOb[i] = new Cloud(random(width/2, width*3/4)*(i+1), random(125, height-300), random(50, 300), random(50, 300));
  }
}

void draw() {
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
  InBackground();
  InBalloon();
  InHPgage();
  InHeel();
  InCloud();
}

void InBackground() {
  back.display();
}

void InBalloon() {
  b.update();
  b.display();
  for (int i = 0; i < 5; i++) {
    if (cloudOb[i].isBound == 1) {
      b.move(-50, 0, 0);
      cloudOb[i].isBound = 0;
    } else if (cloudOb[i].isBound == 2) {
      b.move(0, 50, 0);
      cloudOb[i].isBound = 0;
    } else if (cloudOb[i].isBound == 3) {
      b.move(0, -50, 0);
      cloudOb[i].isBound = 0;
    }
    if (heelOb[i].isHeel) {
      b.airVolIn();
      heelOb[i].isHeel = false;
    }
  }
  balloonGameOver();
}

void balloonGameOver() {
  if (b.x - b.r/2 < 0) {
    scene = 2;
  }
  if (b.r > rMax) {
    image(img, b.x-b.r/2, b.y-b.r/2, 200, 200);
    b.isOverHeel = true;
    count += 1;
    if(count == 60){
      scene = 2;
    }
  }
}

void InHPgage() {
  h.update(b.r/200);
  h.display();
}

void InHeel() {
  for (int i = 0; i < 5; i++) {
    heelOb[i].display();
    heelOb[i].move();
    heelOb[i].isAtackJudge(b.x, b.y, b.r);
  }
}

void InCloud() {
  for (int i = 0; i < 5; i++) {
    cloudOb[i].display();
    cloudOb[i].update();
    cloudOb[i].isAtackJudge(b.x, b.y, b.r);
  }
}

void keyPressed() {
  if (keyCode == UP) {
    b.move(0, -10, 0);
  }
  if (keyCode == DOWN) {
    b.move(0, 10, 0);
  }

  if (key == 'r' && scene != 1) {
    scene = 1;
  }
  if (key == 's' && scene == 1) {
    scene = 4;
  }
}

void keyReleased() {
  if (keyCode == RIGHT) {
    b.move(100, 0, 100);
  }
}
