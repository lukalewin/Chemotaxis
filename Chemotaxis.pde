Mover[] dots;
Rocket a;
Fire b;
Moon c;
Turbo d;
Man e;
boolean mouseActive = false;
boolean spaceActive = false;
float x, y;
float easing = 0.05;
void setup()
{
  size(700,700);
  stroke(5);
  smooth();
  cursor(CROSS);
  frameRate(60);
  dots = new Mover[150];
  x = 325;
  y = 325;
  
  for(int i = 0; i < dots.length;i++)
  {
    dots[i] = new Mover();
  }

}
void draw()
{
  background(10);
  
  // mouse follow source from https://processing.org/examples/easing.html
  float targetX = mouseX;
  float newX = targetX - x;
  x += newX * easing;
  
  float targetY = mouseY;
  float newY = targetY - y;
  y += newY * easing;
  
  for(int i = 0; i < dots.length;i++)
  {
    dots[i].show();
    dots[i].move();
  }
  
  a = new Rocket(x,y);
  b = new Fire(x,y);
  c = new Moon(50,50);
  d = new Turbo(x,y);
  e = new Man(x,y);
  c.walk();
  c.show();
  a.walk();
  b.walk();
  b.show();
  a.show();
  
  if (mouseActive && spaceActive) {
   d.walk();
   d.show();
   a.walk();
   a.show();
   e.walk();
   e.show();
  } else if (mouseActive) {
   d.walk();
   d.show();
   a.walk();
   a.show();
  } else if (spaceActive) {
   e.walk();
   e.show();
  } 
}

void mousePressed() {
  mouseActive = true;
}
void mouseReleased() {
  mouseActive = false;
}
void keyPressed() {
  char space = ' ';
  if (key == space) {
    if (spaceActive) {
     spaceActive = false;
    } else {
     spaceActive = true; 
    }
  }
}


// Split up fire and rocket so that there could be a larger walk with the fire.

class Rocket
{
  float myX, myY;
  Rocket(float x, float y)
 {
    myX = x;
    myY = y;
  }
  void show()
 {  
     fill(195);
     triangle(myX,myY,myX-25,myY+50,myX+25,myY+50);
     rect(myX-25,myY+50,50,75);
     fill(255,0,0);
     triangle(myX-25,myY+125,myX-25,myY+100,myX-45,myY+150);
     triangle(myX+25,myY+125,myX+25,myY+100,myX+45,myY+150);
     rect(myX-15,myY+125,30,5);
     fill(5);
     ellipse(myX,myY+75,25,25);
     fill(173,216,230);
     ellipse(myX,myY+75,23,23);
     
}
  void walk()
  {
    myX = myX + (int)(Math.random()*3)-1;
    myY = myY + (int)(Math.random()*3)-1;
  }
}

class Fire
{
  float myX, myY;
  Fire(float x, float y)
 {
    myX = x;
    myY = y;
  }
  void show(){
     stroke(0);
     strokeWeight(1);
     fill(255,165,0);
     triangle(myX-15,myY+120,myX+15,myY+120,myX,myY+150);
     
}
  void walk()
  {
    myX = myX + (int)(Math.random()*5)-1;
    myY = myY + (int)(Math.random()*5)-1;
  }
}

class Turbo
{
  float myX, myY;
  Turbo(float x, float y)
 {
    myX = x;
    myY = y;
  }
  void show(){
     stroke(0);
     strokeWeight(1);
     fill(255,25,0);
     triangle(myX-17,myY+120,myX+17,myY+120,myX,myY+195);
     fill(255,65,0);
     triangle(myX-15,myY+120,myX+15,myY+120,myX,myY+180);
     fill(255,115,0);
     triangle(myX-13,myY+120,myX+13,myY+120,myX,myY+155);
     fill(255,145,0);
     triangle(myX-11,myY+120,myX+11,myY+120,myX,myY+135);
}
  void walk()
  {
    myX = myX + (int)(Math.random()*7)-1;
    myY = myY + (int)(Math.random()*7)-1;
  }
}

class Moon
{
  float myX, myY;
  Moon(float x, float y)
 {
    myX = x;
    myY = y;
  }
  void show(){
     stroke(166, 183, 226);     
     strokeWeight(4);
     fill(202,212,237);
     ellipse(myX,myY,250,250);
     strokeWeight(1);
     stroke(204,220,243); 
     fill(230,236,250);
     ellipse(myX+40,myY-20,51,49);
     ellipse(myX-50,myY+50,49,51);
     ellipse(myX+60,myY+57,51,52);
     ellipse(myX,myY+81,31,32);
     ellipse(myX-40,myY-10,35,36);
     
}
  void walk()
  {
    myX = myX + (int)(Math.random()*1);
    myY = myY + (int)(Math.random()*1);
  }
}

class Mover {
  float x, y;
 Mover() {
  x = (int)(Math.random()*701);
  y = (int)(Math.random()*701);
 }
 void move(){
  x = (int)(Math.random()*701);
  y = (int)(Math.random()*701);
 }
 void show(){
  strokeWeight(1);
  fill((int)(Math.random()*256));
  ellipse(x,y,2,2);
 }
}

class Man
{
  float myX, myY;
  Man(float x, float y)
 {
    myX = x;
    myY = y;
  }
  void show()
 {  
     fill(0);
     ellipse(myX-3,myY+75,9,9);
     fill(255);
     ellipse(myX-3,myY+75,8,8);
     fill(0);
     rect(myX-4,myY+79,2,8);
     rect(myX-3,myY+82,6,1);
     strokeWeight(2);
     line(myX+3,myY+82,myX+5,myY+79);
     ellipse(myX+5,myY+79,1,1);
     
}
void walk()
  {
    myX = myX + (int)(Math.random()*2)-1;
    myY = myY + (int)(Math.random()*2)-1;
  }
}
