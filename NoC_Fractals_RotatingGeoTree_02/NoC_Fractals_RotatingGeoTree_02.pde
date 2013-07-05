// By: @sandsfish

// Adapted from:
//   The Nature of Code
//   Daniel Shiffman
//   http://natureofcode.com
//   Recursive Tree
//   https://github.com/shiffman/The-Nature-of-Code-Examples/blob/master/Processing/chp8_fractals/NOC_8_06_Tree/NOC_8_06_Tree.pde

float theta;   
float rotation, rotationRev = 0.0;
int BRANCH_COUNT = 200;
void setup() {
  size(displayWidth, 1000, OPENGL);
}

void draw() {
  background(35);
//  painful psych freakout mode
//  background(mouseX, random(255), random(255), 35);
  theta = map(mouseX, 0, width, 0, PI/2);

  translate(width/2, height-150);
  stroke(0);
  colorMode(RGB);
  spotLight(width/2, 102, 126, 80, 20, 40, -1, 0, 0, PI/2, 2);
  spotLight(width/2, 102, 126, width/2, 0, 500, -1, 0, 0, PI/4, 2);
  branch(BRANCH_COUNT);
  rotation += 0.0007;
  
}

void branch(float len) {
  noStroke();
  fill(200, 50);
//  sparkle:
//  fill(random(25), random(255), random(255), 35);
  fill(mouseX, random(255), random(255), 35);
  int fillValue = (int)map(len, 0, height, 0, 200);
//  fill(fillValue+25, 100, fillValue-100, 20);
  rotateY(rotation);

  box(-len, 250, 200);
  translate(0, -len);

  len *= 0.66;
  
  if(len > BRANCH_COUNT-2) {
    fill(0);
  }
  
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

