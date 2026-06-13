
class Bird {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  PImage bird;

  Bird(float x, float y) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(random(-2, 2), random(-2, 2));
    position = new PVector(x, y);
    r = 3.0;
    maxspeed = 1.8;
    maxforce = 0.03;
    bird = loadImage("bird.png");
  }

  void run(ArrayList<Bird> birds) {
    flock(birds);
    update();
    borders();
    render();
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }


  void flock(ArrayList<Bird> birds) {
    PVector sep = separate(birds);   // Separation
    PVector ali = align(birds);      // Alignment
    PVector coh = cohesion(birds);   // Cohesion


    // Arbitrarily weight these forces
    sep.mult(1.5);
    ali.mult(0.7);
    coh.mult(1.0);

    // Add the force
    applyForce(sep);
    applyForce(ali);
    applyForce(coh);
  }

  // Method to update position
  void update() {
    // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(maxspeed);
    position.add(velocity);
    // Reset accelertion to 0 each cycle
    acceleration.mult(0);
  }

  // A method that calculates and applies a steering force towards a target
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, position);  // A vector pointing from the position to the target
    // Normalize desired and scale to maximum speed
    desired.normalize();
    desired.mult(maxspeed);
    // Steering = Desired minus Velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);  // Limit to maximum steering force
    return steer;
  }

  void render() {

    image(bird, position.x, position.y, 30, 30);
  }

  //keep the birds inside the borders of the windows
  void borders() {
    float leftBound   = 232;
    float rightBound  = 668;
    float topBound    = 180;
    float bottomBound = 450;

    if (position.x < leftBound + r) {
      position.x = leftBound + r;
      velocity.x *= -1;
    } else if (position.x > rightBound - r) {
      position.x = rightBound - r;
      velocity.x *= -1;
    }

    if (position.y < topBound + r) {
      position.y = topBound + r;
      velocity.y *= -1;
    } else if (position.y > bottomBound - r) {
      position.y = bottomBound - r;
      velocity.y *= -1;
    }
  }




  // Separation
  // Method checks for nearby birds and let members steer away
  PVector separate (ArrayList<Bird> birds) {
    float desiredseparation = 25.0f;
    PVector steer = new PVector(0, 0, 0);
    int count = 0;
    // For every bird in the system check if it is close
    for (Bird other : birds) {
      float d = PVector.dist(position, other.position);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(position, other.position);
        diff.normalize();
        diff.div(d);        //calculate difference and devide by d
        steer.add(diff);
        count++;            // Keep track of how many birds are there
      }
    }
    if (count > 0) {
      steer.div((float)count);
    }

    // As long as the vector is greater than 0
    if (steer.mag() > 0) {
      //Steering = Desired - Velocity
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(velocity);
      steer.limit(maxforce);
    }
    return steer;
  }

  // Alignment
  // For every nearby bird in the system, calculate the average velocity
  PVector align (ArrayList<Bird> birds) {
    float neighbordist = 50;
    PVector sum = new PVector(0, 0);
    int count = 0;
    for (Bird other : birds) {
      float d = PVector.dist(position, other.position);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.velocity);
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      sum.normalize();
      sum.mult(maxspeed);
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxforce);
      return steer;
    } else {
      return new PVector(0, 0);
    }
  }

  // Cohesion
  // For the average position (center) of all nearby birds, calculate steering vector towards that position
  PVector cohesion (ArrayList<Bird> birds) {
    float neighbordist = 50;
    PVector sum = new PVector(0, 0);   // Start with empty vector
    int count = 0;
    for (Bird other : birds) {
      float d = PVector.dist(position, other.position);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.position); // Add position
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      return seek(sum);  // Steer towards the position
    } else {
      return new PVector(0, 0);
    }
  }
}
