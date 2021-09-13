int scene = 1;

float toriX, toriY;
float rMax = 200;
float rMin = 50;
PImage img;
int delayCount = 0;
boolean gameover = false;
int scoreCount = 0;
int HPCnt = 10;
int CloudCnt = 5;
int ToriCnt = 5;

Screen screen;
Balloon balloon;
HP hp;
Background back;
Heel []heelOb = new Heel[HPCnt];
Cloud []cloudOb = new Cloud[CloudCnt];
Tori []toriOb = new Tori[ToriCnt];
Goal g;
Button button, expButton, returnButton;

void setup() {
  size(1200, 800);
  img  = loadImage("image/haretu.png");
  callClass();
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

void callClass() {
  screen = new Screen();
  balloon = new Balloon(width/6, height/2, rMax);
  hp = new HP();
  back = new Background();
  g = new Goal();
  float hpX = width*6/8;
  for (int i = 0;i < HPCnt; i++){
    heelOb[i] = new Heel(hpX, random(125, height-125), random(1, 3));
    hpX += width*3/8;
  }
  
  for (int i = 0; i < ToriCnt; i++) {
    cloudOb[i] = new Cloud(random(width/2, width*3/4)*(i+1), random(125, height-300), random(50, 200), random(50, 200), random(1, 3));
    toriX = random(width/2, width*3/4)*(i+2);
    toriY = random(125, height-300);
    toriOb[i] = new Tori(toriX, toriY, toriX-40, toriY+20, toriX, toriY+40, random(1, 3));
  }
  button=new Button(width/2, height/2, 200, 100, "START!");
  returnButton = new Button(width/2, height/2, 200, 100, "RETURN");
  scoreCount = 0;
}
void Start() {
  screen.Start();
  if (!button.isPush()) {
    button.run();
  } else {
    scene = 4;
  }
}

void Gameover() {
  screen.End();
  if (!returnButton.isPush()) {
    returnButton.run();
  } else {
    callClass();
    scene = 1;
  }
}

void Clear() {
  screen.Clear();
  if (!returnButton.isPush()) {
    returnButton.run();
  } else {
    callClass();
    scene = 1;
  }
}

void Game() {
  InBackground();
  InBalloon();
  InHPgage();
  InHeel();
  InCloud();
  InTori();
  InCount();
}

void InBackground() {
  back.display();
}

void InBalloon() {
  balloon.update((balloon.r-rMin)/(rMax-rMin));
  balloon.display();
  for(int i = 0;i < HPCnt;i++){
    if (heelOb[i].isHeel) {
      balloon.airVolIn();
      heelOb[i].isHeel = false;
    }
  }
  for (int i = 0; i < CloudCnt; i++) {
    if (cloudOb[i].isBound == 1) {
      balloon.move(-50, 0, 0);
      cloudOb[i].isBound = 0;
    } else if (cloudOb[i].isBound == 2) {
      balloon.move(0, 50, 0);
      cloudOb[i].isBound = 0;
    } else if (cloudOb[i].isBound == 3) {
      balloon.move(0, -50, 0);
      cloudOb[i].isBound = 0;
    }
    
    if (toriOb[i].isTori) {
      gameover = true;
      toriOb[i].isTori = false;
    }
  }
  if (scoreCount >= 1500 && g.x1 <= balloon.x + balloon.r/2) {  
    scene = 3;
  }
  balloonGameMove();
}

void balloonGameMove() {
  if (balloon.x - balloon.r/2 < 0 || balloon.y < 0 || balloon.y > height) {
    scene = 2;
  }
  if (balloon.r > rMax || gameover) {
    image(img, balloon.x-balloon.r/2, balloon.y-balloon.r/2, 200, 200);
    balloon.isOverHeel = true;
    delayCount += 1;
    if (delayCount == 60) {
      delayCount = 0;
      scene = 2;
      gameover = false;
    }
  }

  if ((balloon.r-rMin)/(rMax-rMin) < 0) {
    scene = 2;
  }
}

void InHPgage() {
  hp.update((balloon.r-rMin)/(rMax-rMin));
  hp.display();
}

void InHeel() {
  for (int i = 0; i < HPCnt; i++) {
    heelOb[i].display();
    heelOb[i].move();
    heelOb[i].isAtackJudge(balloon.x, balloon.y, balloon.r);
  }
}

void InCloud() {
  for (int i = 0; i < CloudCnt; i++) {
    cloudOb[i].display();
    cloudOb[i].update();
    cloudOb[i].isAtackJudge(balloon.x, balloon.y, balloon.r);
  }
}

void InTori() {
  for (int i = 0; i < ToriCnt; i++) {
    toriOb[i].display();
    toriOb[i].update();
    toriOb[i].isAtackJudge(balloon.x, balloon.y, balloon.r/2);
  }
}

void InCount() {
  text(scoreCount+"m", width*7/8, 100);  
  if (scoreCount >= 1500) {  
    g.display();
  } else {  
    scoreCount++;
  }
}

void keyPressed() {
  if (keyCode == UP && !balloon.isOverHeel) {
    balloon.move(0, -10, 0);
  }
  if (keyCode == DOWN && !balloon.isOverHeel) {
    balloon.move(0, 10, 0);
  }
}

void keyReleased() {
  if (keyCode == RIGHT && !balloon.isOverHeel) {
    balloon.move(100, 0, 30);
  }
}
