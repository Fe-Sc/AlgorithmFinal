//Flocking code based on flocking code (boids flocking) by Daniel Shiffman, modified and used by Fernando Schintz and Tim Goedejohan
class Bird {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxForce;    // Maximum steering force
  float maxSpeed;    // Maximum speed
  PImage bird;

  Bird(float x, float y) { //gives the bird a position
    acceleration = new PVector(0, 0); //starts without acceleration
    velocity = new PVector(random(-2, 2), random(-2, 2)); //gives a random velocity
    position = new PVector(x, y);
    r = 3.0;
    maxSpeed = 1.5;
    maxForce = 0.06;
    bird = loadImage("flyingbird.png");
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
    PVector sep = separate(birds);   //separation (makes sure the birds dont touch each other, steer away from other birds)
    PVector ali = align(birds);      //alignment (how much they copy other birds directoins)
    PVector coh = cohesion(birds);   //cohesion (how close are they to one another)


    //arbitrarily weight these forces
    sep.mult(1.0);
    ali.mult(0.3);
    coh.mult(0.4);

    //add the force
    applyForce(sep);
    applyForce(ali);
    applyForce(coh);
  }

  //method to update position
  void update() {
    //update velocity
    velocity.add(acceleration);
    //limit speed
    velocity.limit(maxSpeed);
    position.add(velocity);
    //reset accelertion to 0 each cycle
    acceleration.mult(0);
  }

  //method that calculates and applies a steering force towards a target
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, position);  //a vector pointing from the position to the target
    //normalize desired and scale to maximum speed
    desired.normalize();
    desired.mult(maxSpeed);
    //steering = desired minus Velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);  //limit to maximum steering force
    return steer;
  }

  void render() {
    image(bird, position.x, position.y, 70, 65);
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




  //separation
  //method checks for nearby birds and let members steer away
  PVector separate (ArrayList<Bird> birds) {
    float desiredSeparation = 25.0f;
    PVector steer = new PVector(0, 0, 0);
    int count = 0;
    //for every bird in the system check if it is close
    for (Bird other : birds) {
      float d = PVector.dist(position, other.position);
      //if the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredSeparation)) {
        //calculate vector pointing away from neighbor
        PVector diff = PVector.sub(position, other.position);
        diff.normalize();
        diff.div(d);  //calculate difference and devide by d
        steer.add(diff);
        count++;  //keep track of how many birds are there
      }
    }
    if (count > 0) {
      steer.div((float)count);
    }

    //as long as the vector is greater than 0
    if (steer.mag() > 0) {
      //Steering = Desired - Velocity
      steer.normalize();
      steer.mult(maxSpeed);
      steer.sub(velocity);
      steer.limit(maxForce);
    }
    return steer;
  }

  //alignment
  //for every nearby bird in the system calculate the average velocity
  PVector align (ArrayList<Bird> birds) {
    float neighborDist = 50;
    PVector sum = new PVector(0, 0);
    int count = 0;
    for (Bird other : birds) {
      float d = PVector.dist(position, other.position);
      if ((d > 0) && (d < neighborDist)) {
        sum.add(other.velocity);
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      sum.normalize();
      sum.mult(maxSpeed);
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxForce);
      return steer;
    } else {
      return new PVector(0, 0);
    }
  }

  //cohesion
  //for the center of all nearby birds, steer towards that
  PVector cohesion (ArrayList<Bird> birds) {
    float neighborDist = 50;
    PVector sum = new PVector(0, 0);   //start with empty vector
    int count = 0;
    for (Bird other : birds) {
      float d = PVector.dist(position, other.position);
      if ((d > 0) && (d < neighborDist)) {
        sum.add(other.position); //add position
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      return seek(sum);  //steer towards the position
    } else {
      return new PVector(0, 0);
    }
  }
}
