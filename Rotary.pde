class Rotary{
  String name;
  int x;
  int y;
  int r;
  int value;
  float angle;
  float angleKorr; //--korrektur
  float angleTemp;
  float angleOld;
  float a;
  color tileColor;  
  boolean isActive = false;
  color c;
  
  Rotary(int x_, int y_, int r_){
    x = x_;
    y = y_;
    r = r_;
    angle = map(value, 0, 360, 0, TWO_PI);
  }
    
  boolean mouseOver(float mx, float my){
    float d = dist(x,y, mx, my);
    if(d < r){
      return true;
    } else {
      return false;
    }
  }
  
  void korrektur(float mx, float my){
    angleKorr = atan2(my-y, mx-x);
    angleOld = angle;
  }
  
  
  void activate(boolean act_){
    isActive = act_;
  }
  
  void update(float mx, float my){
    if(isActive){
      angleTemp = atan2(my-y, mx-x);
      angle = angleTemp -angleKorr+angleOld;
      if(angle> TWO_PI){
        angle = 0;
      } else if (angle < 0){
        angle = TWO_PI;
      }
    }
  }
  
  void display(float mx, float my){
    if ((mouseOver(mx, my))|| isActive){
      c = hi_lite;
    } else {
      c = default_c;
    }
    stroke(c);
    strokeWeight(4);
    fill(backC);
    ellipse(x, y, 2*r,2*r);
    pushMatrix();
    translate(x,y);
    rotate(angle);
    line(0,0- r+9,0,0);
    popMatrix();
    strokeWeight(1);
    value = int(map(angle, 0, TWO_PI, 0, 360));
    
    textAlign(CENTER, TOP);
    fill(hi_lite);
    text("Angel-Korrektur: " + angleKorr, width/4, 270);
    text("Temp. Angel: " + angleTemp, width/4, 295);
    text("Angel: " + angle, width/4, 320);

  }
}
