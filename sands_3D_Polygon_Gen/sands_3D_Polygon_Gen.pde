boolean redrawShape = false;
float xPos, yPos;
PVector xCenter, yCenter;
PolyShape shape;

void setup() {
  size(700, 394, OPENGL);
  stroke(0, 100);
  fill(30, 100);
  stroke(0, 0, 200);
  strokeWeight(2);
  
  shape = new PolyShape(20);
  smooth();
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
  
  shape.display();
}

void mouseMoved() {
  changeSomething(PApplet.map(mouseX, 0, width, 0, 1), PApplet.map(mouseY, 0, height, 0, 1));
}

void keyPressed() {
  doSomething(); 
}
