
// Sands Fish // @sandsfish // sandsfish.com

// Testing code from:
//   http://natureofcode.com/book/chapter-7-cellular-automata/
CA ca;

void setup() {
  size(1000, 1000);
  ca = new CA(); 
}

void draw() {
  // Explicitly draw the seed generation
  if(frameCount == 1) {
    ca.display();
  }
  ca.generate();
  ca.display();  
}
