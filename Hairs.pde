//handles the logic and physics behind the hairs and their interaction with water
class hair {
  PVector position;
  PVector velocity;
  float lifespan;
  float angle;
  Glass glass;
  PVector windforce;
  Watermanagement wm;

  hair(PVector pos, Glass g, Watermanagement wm) {
    //makes the velocity a random vector
    velocity = new PVector(random(-1.5, 1.5), random(0, 5));
    windforce = new PVector();
    position = pos.copy();
    //makes the lifespan 255
    lifespan = 255.0;
    angle = random(-2, 2); //random angle
    glass = g;
    this.wm = wm;
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
    //wind
    windforce.set(random(-0.5, 0.55), 0);
    if (glass.isBroken()){
      velocity.add(windforce);
    }

    //logic to handle generating splashes in the bowl
    if(position.x > wm.leftBound && position.x < wm.rightBound && position.y >= wm.topBound){ //checks if hair is inside the bounds of the waterbowl
      int index = int((position.x - wm.leftBound) / 6); //check what segment the hair landed on and gives it a value of index, devide by 6 because the offset is 6, subtract leftbound to get a relative position
      wm.watersystems[index].force = 3; //applies force
      lifespan = -1; //kills the particle
    }

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
