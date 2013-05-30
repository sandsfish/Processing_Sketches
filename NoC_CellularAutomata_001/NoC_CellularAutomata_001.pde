// Testing code from:
//   http://natureofcode.com/book/chapter-7-cellular-automata/
CA ca;

void setup() {
 
  size(1000, 800);
  ca = new CA(); 
}

void draw() {
  ca.generate();
  ca.display();  
}
