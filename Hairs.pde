//handles the logic and physics behind the hairs and their interaction with water
//also handles wind physics for hairs
//also handles lifetime of hairs on the ground
class hair {
  PVector position;
  PVector velocity;
  float lifespan;
  float angle;
  Glass glass;
  PVector windforce;
  Watermanagement wm;
  float t;
  boolean resting = false;
  float restTimer = 0;

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
    t = random(1000); // unique noise "seed" per hair, which gives a unique perlin noise value for each new hair that gets generated, so they dont all fly the same way
  }

  void update() {
    //add velocity to the hairs every frame
    position.add(velocity);
    //rest on the bottom for a short time before removing
    if (position.y >= height-5) {
      position.y = height-5;
      velocity.y = 0;
      if (resting == false) {
        resting = true;
        restTimer = 120; //frames the hairs sit on the bottom, 120 being 2 seconds
      }
    }
    //when hair rests on ground
    //decreases restTimer every frame, pushes velocity.x towards 0 each frame and constrains it to not be lower than 0, to simulate hairs slowing down
    if (resting) {
      restTimer -= 1;
      if (velocity.x < 0){
      velocity.x += 0.05;
    }
    else if (velocity.x > 0){
      velocity.x -= 0.05;
    }
      velocity.x = max(velocity.x, 0);
      if (restTimer <= 0) {
        lifespan = -1;
      }
    } else {
      lifespan -= 2.0;       //decreases the lifespan every frame while flying
    }
    
    //creates wind whenever the glass is broken
    windforce.set(map(noise(t), 0, 1, -0.5, 0.5), 0);
    t += 0.05;
    if (glass.isBroken()){
      velocity.add(windforce);
    }

    //handles creating splashes in the bow
  
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
