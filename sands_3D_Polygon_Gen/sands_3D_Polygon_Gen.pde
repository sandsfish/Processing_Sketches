import java.util.Date;

boolean redrawShape = false;
float xPos, yPos;
PVector xCenter, yCenter;
PolyShape shape;
String currentRun;

void setup() {
  size(displayWidth, displayHeight, OPENGL);
  stroke(0, 100);
  fill(30, 50);
  stroke(0, 0, 200);
//  noStroke();
  strokeWeight(2);
  
//  shape = new PolyShape(20);
  shape = new PolyShape(400);
  smooth();
  
  Date d = new Date();
  currentRun = String.valueOf(d.getDay()) + String.valueOf(d.getHours()) + String.valueOf(d.getMinutes());
}

void doSomething() {
  shape.update();
}

void changeSomething(float x, float y) {
  if(x > 0.8) {
    shape.regen();
  }
  
//  if(y something something something) {
//    something 
//  }

}

void draw() {
  lights();
  
  fill(30, 100);
  background(200);
  
  shape.update();
  shape.display();
  
  
  saveFrame("/Users/sands/Movies/PROCESSING/sands_3D_PolyShape/frames" + currentRun + "/intersects#####.tiff");
}

void mouseMoved() {
  changeSomething(PApplet.map(mouseX, 0, width, 0, 1), PApplet.map(mouseY, 0, height, 0, 1));
}

void keyPressed() {
  doSomething(); 
}
