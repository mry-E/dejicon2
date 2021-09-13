class Explain {
  PImage back, tori, heel, cloud;
  Explain() {
    back = loadImage("image/sora.png");
    tori = loadImage("image/tori.png");
    heel = loadImage("image/kuukiire.png");
    cloud = loadImage("image/kumo.png");
    back.resize(width, height);
  }

  void display() {
    background(back);
    fill(255);
    textSize(45);
    textAlign(LEFT);
    text("操作説明", width/12, height/7);
    text("障害物",width*7/12,height/7);
    textSize(32);
    text("キーボードで簡単操作！", width/12, height*2/7);
    text("↑", width/8, height*3/8);
    text("→", width*3/13, height/2+30);
    text("↓", width/8, height*6/8);
    textSize(24);
    text("風船が上に移動", width*2/12, height*3/8);
    text("風船内の空気を使い右に移動", width*4/14, height/2+30);
    text("風船が下に移動", width*2/12, height*6/8);
    stroke(0);
    line(width/8+20, height/2+75, width/8+20, height/2+125);
    noStroke();
    fill(255, 0, 0);
    ellipse(width/8+20, height/2+20, 150, 150);
    triangle(width/8+10, height/2+30+75, width/8+20, height/2+75, width/8+30, height/2+30+75);
    image(tori,width*7/12,height*2/7-50,100,100);
    fill(255);
    text("空を飛んでる鳥に当たると",width*8/12+20,height*2/7-30);
    text("一発で割れるから注意しよう",width*8/12+20,height*2/7+20);
    image(heel,width*12/14,height*4/7-100,100,100);
    text("風船の空気を回復できるぞ",width*7/12,height*4/7-80);
    text("しかし、とりすぎ注意だ",width*7/12,height*4/7-30);
    image(cloud,width*7/12,height*6/7-150,100,100);
    text("雲に当たるとはじかれるぞ",width*8/12+10,height*6/7-120);
    text("左壁まで行かないようにしよう",width*8/12+10,height*6/7-70);
  }
}
