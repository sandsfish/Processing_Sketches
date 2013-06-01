class CA {
  int[] cells;
  int[] ruleset;
  int w = 2;
  //The CA should keep track of how many generations.
  int generation = 0;
  color firstColor = color(25, 25, 255);
  color secondColor = color(255, 44, 50);
  color genColor = firstColor;

  CA() {
    cells = new int[width/w];
    ruleset = new int[] {
      0, 1, 0, 1, 1, 0, 1, 0
    };
    cells[cells.length/2] = 1;
  }

  //Function to compute the next generation
  void generate() {
    int[] nextgen = new int[cells.length];
    for (int i = 1; i < cells.length-1; i++) {
      int left   = cells[i-1];
      int me     = cells[i];
      int right  = cells[i+1];
      nextgen[i] = rules(left, me, right);
    }
    cells = nextgen;
    
    // advance lerp per generation
    genColor = lerpColor(firstColor, secondColor, map(generation, 0, height/w, 0.0, 1.0));
    
    //Increment the generation counter.
    generation++;
  }

  int rules(int a, int b, int c) {
    String s = "" + a + b + c;
    int index = Integer.parseInt(s, 2);
    return ruleset[index];
  }

  void display() {
    for (int i = 0; i < cells.length; i++) {
      if (cells[i] == 1) {
        stroke(1);
        fill(255);
      } else {
        fill(genColor);
      }
      //Set the y-location according to the generation.
      rect(i*w, generation*w, w, w);
    }
  }
}
