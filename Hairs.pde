//particle system partially based on code by Daniel Shiffman, modified and adjusted by Fernando Schintz and Tim Goedejohan
class hair {
  PVector position;
  PVector velocity;
  float lifespan;
  float angle;

  hair(PVector pos) {
    //makes the velocity a random vector
    velocity = new PVector(random(-1.5, 1.5), random(0, 5));
    position = pos.copy();
    //makes the lifespan 255
    lifespan = 255.0;
    angle = random(-2, 2); //random angle
  }
  void run() {
    update();
    display();
  }
  void update() {
    //add velocity to the hairs every frame
    position.add(velocity);
    //decreases the lifespan every frame
    lifespan -= 2.0;
  }
  void display() { //creates the hairs
    pushMatrix();
    translate(position.x, position.y); //
    rotate(angle); //hairs get a random angle
    noStroke();
    fill(#716659);
    rect(0, 0, 1, 8); //to draw the rect relative to the translated origin
    popMatrix();
  }
  boolean isDead() {
    return lifespan < 0;
  }
}
