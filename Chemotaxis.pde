Mover[] dots;
float x, y;
float easing = 0.05;
void setup()
{
  size(750,750);
  stroke(5);
  smooth();
  cursor(CROSS);
  frameRate(60);
  dots = new Mover[150];
  
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
  
  Rocket a = new Rocket(x,y);
  Fire b = new Fire(x,y);
  Moon c = new Moon(50,50);
  c.walk();
  c.show();
  a.walk();
  b.walk();
  b.show();
  a.show();
  
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
   //triangle(375,100,350,150,400,150);
   //rect(350,150,50,75);
   //fill(255,0,0);
   //triangle(350,225,350,200,330,250);
   //triangle(400,225,400,200,420,250);
   //rect(360,225,30,5);
   //fill(255,165,0);
   //triangle(365,230,385,230,375,250);
   //fill(5);
   //ellipse(375,175,25,25);
   //fill(173,216,230);
   //ellipse(375,175,23,23);
  
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
  x = (int)(Math.random()*750);
  y = (int)(Math.random()*750);
 }
 void move(){
  x = (int)(Math.random()*750);
  y = (int)(Math.random()*750);
 }
 void show(){
  fill(255);
  ellipse(x,y,2,2);
 }
}
