
// Fill the screen with a matrix of animated circles

float time = 0;
float radius = 0;

void setup() {
  background(5);
  size(displayWidth,displayHeight, OPENGL);
  noStroke();
}

void draw() {
  noiseDetail((int)map(mouseX, 0, displayWidth, 0, 10));
  for(int y = 22; y < height-50; y+=22) {
    for(int x = 25; x < width-11; x+=22) {
      time = time + 0.005;
      radius = map(noise(time), 0, 1, 0, 20);
      fill(radius, (int)random(255), (int)random(255));
      //float randX = map(mouseX, 0, width, 0, 200);
      ellipse(x, y, radius, radius);
    }
  }
}
