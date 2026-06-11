class hair{
  PVector position;
  PVector velocity;
  float lifespan;
  
  hair(PVector pos) {
    velocity = new PVector(random(-5, 5), random(-2, 0));
    position = pos.copy();
    lifespan = 255.0;
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
    stroke(0, lifespan);
    strokeWeight(2);
    fill(127, lifespan);
    noStroke();
    fill(#FFD700);
    ellipse(position.x, position.y, 12, 12);
  }
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}
