class HP{
  float x,y,len,val;
  float hpGage;
  HP(){
    x = 50;
    y = 100;
    len = 300;
    val = 50;
    hpGage = len;
  }
  
  void display(){
    fill(255);
    rect(x,y,len,val);
    noStroke();
    fill(0,255,0);
    rect(x,y,hpGage,val);
  }
  
  void update(float balloonHP){
    if(hpGage > 0){
      hpGage = len*balloonHP;
    }
  }
  
}
