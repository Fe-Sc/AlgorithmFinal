class hair {
  PVector position;
  PVector velocity;
  float lifespan;
  float angle;

  hair(PVector pos) {
    velocity = new PVector(random(-1.5, 1.5), random(0, 5));
    position = pos.copy();
    lifespan = 255.0;
    angle = random(-2, 2); //random angle
  }
  void run() {
    update();
    display();
  }
  void update() {
    position.add(velocity);
    lifespan -= 2.0;
  }
  void display() {
    pushMatrix();
    translate(position.x, position.y);
    rotate(angle);
    noStroke();
    fill(#716659);
    rect(0, 0, 1, 8); //to draw the rect relative to the translated origin
    popMatrix();
  }
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
