// mutator:  sands fish
// based on the code from
//  http://formandcode.com/code-examples/visualize-superformula

float scaler = 300;
int m = 20;
float n1 = 10;
float n2 = 10;
float n3 = 1;

void setup() {
  size(900, 900);
  smooth();
  noFill();
  stroke(255);
}

void draw() {
  background(0);

  pushMatrix();
  translate(width/2, height/2);

  float newscaler = scaler;
  for (int s = 16; s > 0; s--) {  
    beginShape();

    float mm = m + s;
    float nn1 = n1 + s;
    float nn2 = n2 + s;
    float nn3 = n3 + s;
    newscaler = newscaler * 0.98;
    float sscaler = newscaler;

    PVector[] points = superformula(mm, nn1, nn2, nn3);
    curveVertex(points[points.length-1].x * sscaler, points[points.length-1].y * sscaler);
    for (int i = 0;i < points.length; i++) {
      curveVertex(points[i].x * sscaler, points[i].y * sscaler);
    }
    curveVertex(points[0].x * sscaler, points[0].y * sscaler);
    endShape();
  }
  popMatrix();
}


PVector[] superformula(float m, float n1, float n2, float n3) {
  // MUTATION:  minimal number of points instead of 360
  int numPoints = 3;
  float phi = TWO_PI / numPoints;
  PVector[] points = new PVector[numPoints+1];
  for (int i = 0;i <= numPoints;i++) {
    // MUTATION:  multiple of m param 
    points[i] = superformulaPoint(m*3, n1, n2, n3, phi * i);
  }
  return points;
}

PVector superformulaPoint(float m, float n1, float n2, float n3, float phi) {
  float r;
  float t1, t2;
  float a=1, b=1;
  float x = 0;
  float y = 0;

  t1 = cos(m * phi / 4) / a;
  t1 = abs(t1);
  t1 = pow(t1, n2);

  t2 = sin(m * phi / 4) / b;
  t2 = abs(t2);
  t2 = pow(t2, n3);

  r = pow(t1+t2, 1/n1);
  if (abs(r) == 0) {
    x = 0;
    y = 0;
  }  
  else {
    r = 1 / r;
    x = r * cos(phi);
    y = r * sin(phi);
  }

  return new PVector(x, y);
}

