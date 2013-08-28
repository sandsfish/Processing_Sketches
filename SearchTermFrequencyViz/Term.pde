class Term {
  String term;
  int frequency;
  float x, y, z;
  float zoomSpeed;

  Term(String _term, int _frequency) {
    term = _term;
    frequency = _frequency;

    init();
  }

  void init() {
    zoomSpeed = random(0.2, 15);
    x = random(width);
    y = random(height);
    z = random(-zDepth, zDepth);
  }
  
  void update() {
    x += zoomSpeed; // * mouseY/150;
    if (x > width+200) {
      init();
      x = -frequency-50;
    }
  }

  void display() {
//        Dramatic slow-down in rendering, but no background
//        drawn and much crisper than TEXTURE mode.
//    textMode(SHAPE);

    pushMatrix();
      translate(x, y, z);

//      Sadly, doesn't improve performance sufficiently
//      if(z < -75) {
//        textMode(SHAPE);
//      }
      noStroke();
      fill(255, 150);
      rect(0, 0, frequency, 5, 10);
      text(term, 0, -5, 0);
    popMatrix();
  }
}
