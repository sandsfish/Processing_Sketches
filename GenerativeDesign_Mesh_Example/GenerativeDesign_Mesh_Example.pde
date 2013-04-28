/**
 * Part of the example files of the generativedesign library.
 *
 * Shows how to use the Mesh class.
 */
import generativedesign.*;
import processing.opengl.*;

float sinFade = 0.0;
float sinSize = 0.0;
float shineValue;

void setup() {
  size(830, 675, OPENGL);
  background(150);
  noStroke();
  smooth();
  fill(0);
}

void draw() {
  // setup lights
  lightSpecular(230, 230, 230); 
  directionalLight((int)map(sin(sinFade), -1, 1, 5, 255), 200, 200, 0.5, 0.5, -1); 
  specular(color(220)); 
  sinFade += 0.09;
  sinSize += 0.03;
  shineValue = map(sin(sinFade), -1, 1, 0, 255);
  shininess(shineValue); 

  // setup view
  translate(500, 300);
  rotateX(-0.2); 
  rotateY(-0.5); 
  scale(45);

  // setup Mesh, set colors and draw  
  Mesh myMesh = new Mesh(this, Mesh.STEINBACHSCREW, (int)map(sin(sinFade), -1, 1, 7, 255), (int)map(sin(sinSize), -1, 1, 7, 255), -3.0, 3.0, -TWO_PI, TWO_PI*1.5);
  myMesh.setColorRange(0, 0, 100, 100, 40, 40, 100);
  myMesh.draw();
  
  //save(“images/”+str(t)+”.gif”);
  saveFrame("images/steinbachscrew-######.gif");
}
