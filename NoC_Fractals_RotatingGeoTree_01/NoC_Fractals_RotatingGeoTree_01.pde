// By: @sandsfish

// Adapted from:
//   The Nature of Code
//   Daniel Shiffman
//   http://natureofcode.com
//   Recursive Tree
//   https://github.com/shiffman/The-Nature-of-Code-Examples/blob/master/Processing/chp8_fractals/NOC_8_06_Tree/NOC_8_06_Tree.pde

float theta;   
float rotation, rotationRev = 0.0;
void setup() {
  size(1000, 1000, OPENGL);
}

void draw() {
  background(255);
  theta = map(mouseX, 0, width, 0, PI/2);

  translate(width/2, height-200);
  stroke(0);
  branch(200);
  rotation += 0.01;
}

void branch(float len) {
  noStroke();
  fill(200, 50);
//  sparkle:
//  fill(random(25), random(255), random(255), 35);
  int fillValue = (int)map(len, 0, height, 0, 200);
  fill(fillValue+25, 100, fillValue-100, 20);
  rotateY(rotation);

  box(-len, 200, 100);
  // Move to the end of that line
  translate(0, -len);

  len *= 0.66;
  if (len > 2) {
    // right branch
    pushMatrix();
    rotate(theta);
    branch(len);
    popMatrix();
    
    // left branch
    pushMatrix();
    rotate(-theta);
    branch(len);
    popMatrix();
  }
}

