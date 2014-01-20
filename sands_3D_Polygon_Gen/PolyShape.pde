class PolyShape {
  int POLY_SHAPE_POINT_COUNT;
  int DEFORM_RANGE = 10;
  PVector[] vertices;
  float t = 0.01;
  
  PolyShape(int _count) {
    POLY_SHAPE_POINT_COUNT = _count;
    vertices = new PVector[POLY_SHAPE_POINT_COUNT];
    regen();
  }
 
  void update() {
    for(PVector p : vertices) {
//      t += 0.001;
      t += 0.001 + random(0.1);
      DEFORM_RANGE = (int)map(noise(t), -1, 1, -20, 20);
      
      fill(map(DEFORM_RANGE, -5, 5, 0, 250), 100);
      
      p.x += random(-DEFORM_RANGE, DEFORM_RANGE);
      p.y += random(-DEFORM_RANGE, DEFORM_RANGE);
      p.z += random(-DEFORM_RANGE, DEFORM_RANGE); 
    }
  }
  
  void display() {
    beginShape(TRIANGLE_STRIP);
      for(PVector p : vertices) {
        vertex(p.x, p.y, p.z); 
      }
    endShape(CLOSE);
  }
  
  void regen() {
    int numberOfVertices = (int)map(mouseY , 1, height, 2, 500);
    vertices = new PVector[numberOfVertices];
    for (int i = 0; i < vertices.length; i++) {
      vertices[i] = new PVector(random(width/1.5)+50, random(height/1.5)+50, random(-500, 500));
    }
  }
}
