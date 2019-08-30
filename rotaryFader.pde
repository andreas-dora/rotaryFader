PFont arial;
float a;
float deg;
color hi_lite = #C0C0C0;
color default_c = #969696;
color backC = color(40);
color backHi = color(70);
color special_c = color(255, 120, 0);

int offset = 5;
int zeile = 22;

Rotary rotary;


void setup(){
  arial = createFont("Arial", 18);
  size(640, 360);
  rotary = new Rotary(width/4, height/2, 70);
}

void draw(){
  background(0);
  hilfsmittel();
  rotary.display(mouseX, mouseY);
  textAlign(CENTER,TOP);
  textFont(arial, 20);
  fill(hi_lite);
  text("Value: " + nf(rotary.value, 3,0), width/4, 80);
}

void mousePressed(){
 if(rotary.mouseOver(mouseX, mouseY)){
   rotary.activate(true);
   rotary.korrektur(mouseX, mouseY);
 }
}

void mouseDragged(){
  if(rotary.isActive){
    rotary.update(mouseX, mouseY);
  }
}
  
void mouseReleased(){
  rotary.activate(false);
}
