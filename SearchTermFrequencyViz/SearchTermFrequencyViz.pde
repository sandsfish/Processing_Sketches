// Search Term Frequency Visualization
// by @sandsfish
// for MIT Libraries

// TODO:  Make Kiosk Mode to automate rotation and pause

Term[] terms;
int[] used;
int DISPLAY_COUNT = 400;
float zDepth = 800;
boolean pause = false;
boolean rotatePause = false;
boolean rotateReverse = false;
boolean titles = true;

void setup() {
  size(displayWidth+200, displayHeight+200, OPENGL);
  smooth();

  println("loading terms.");
  String[] data = loadStrings("search_word_frequency_6.13.2013-8.11.2013.txt");

  terms = new Term[data.length];
  used = new int[data.length];

  for (int i = 0; i < terms.length; i ++ ) {  
    String[] values = split(data[i], ","); 
    terms[i] = new Term(values[0].trim(), Integer.parseInt(values[1].trim()));
  }
  
  println("done loading " + data.length + " terms.  using top " + DISPLAY_COUNT + ".");
}

float yPos = 0;

void draw() {
  background(50);
  
  if(titles) {
    drawTitles();
  }
  
  pushMatrix();
  translate(width/2-100, 0);
  rotateY(yPos);

  for (int x = 0; x < DISPLAY_COUNT; x++) {
    if (!pause) {
      terms[x].update();
    }
    terms[x].display();
  }
  popMatrix();
  
  if(!rotatePause && !rotateReverse) {
    yPos += 0.05 + -1*map(mouseX, 0, width, 0.001, 0.1);
  } else if(!rotatePause && rotateReverse) {
    yPos -= 0.05 + -1*map(mouseX, 0, width, 0.001, 0.1);
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    pause = !pause;
  } else if (mouseButton == RIGHT) {
    rotatePause = !rotatePause;
  }
}

void keyPressed() {
  if(key == 't') {
    titles = !titles;
  }  
}

void drawTitles() {
  fill(30, 100);
  noStroke();
  rectMode(CORNER);
  rect(0, 0, width, 150);
  fill(255, 100);
  textSize(20);
  text("MIT Libraries - Most frequently searched terms", 110, 130);
  
  fill(30, 100);
  rect(0, height-150, width, 150);
  fill(255, 100);
  text("visualization by @sandsfish", 110, height-118);
}
