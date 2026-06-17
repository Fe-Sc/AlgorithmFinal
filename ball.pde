class Ball {
  PImage ball;
  PVector position = new PVector();
  PVector velocity = new PVector();
  PVector acceleration = new PVector();
  PVector startPos = new PVector();
  float airtime = 0;
  boolean thrown = false;
  boolean outside = false;
  boolean hidden = false;

  //constructor that gives starting position and starting velocity
  Ball(PVector position, PVector velocity) {
    //gives the ball an image
    ball = loadImage("TennisBall.png");
    this.position.set(position);
    this.velocity.set(velocity);
    //starts with no acceleration
    this.acceleration.set(0, 0);
  }

  //second constructor that only gives a starting position
  Ball(PVector position) {
    ball = loadImage("TennisBall.png");
    this.position.set(position);
    //start with no velocity and no acceleration
    this.velocity.set(0, 0);
    this.acceleration.set(0, 0);
  }

  void update(boolean isBroken) {
    //the physics of velocity and position are added
    velocity.add(acceleration);
    position.add(velocity);
    if (thrown) { //counts airtime since thrown
      airtime += 15;
    }

    if (position.y < 450 && position.x >= 230 && position.x <= 670) { //if the ball is inside the bounds of the window, it is outside
      outside = true;
    }
    //hide the ball if it is outside, and outside the boundaries of the window
    if (isBroken && position.x > 680 && position.y > 170 && position.y < 470) hidden = true;
    if (isBroken && position.x > 170 && position.x < 680 && position.y < 170 ) hidden = true;
    if (isBroken && outside && position.y >= 450 && position.x >= 230 && position.x <= 670) hidden = true;
  }


  void display() {
    if (hidden) return; //if hidden is true, stop rendering the ball by exiting the method early
   

    imageMode(CENTER);
    float currentSizeW = map(airtime, 0, 800, 120, 1); //maps the airtime variable with the currentsize variable
    float currentSizeH = map(airtime, 0, 800, 120, 1);
    currentSizeW = constrain(currentSizeW, 70, 150); //constrain the value of current size so the ball doesnt get smaller than those values
    currentSizeH = constrain(currentSizeH, 50, 125);
    image(ball, position.x, position.y, currentSizeW, currentSizeH); //makes the ball using the size and position that are caculated
  }



  boolean isOutOfScreen() { //check if the ball is out of screen
    return (position.x < 0 ||
      position.x > width ||
      position.y < 0 ||
      position.y > height);
  }
  void reset(PVector position) { //resets the ball to the starting position
    this.position.set(position);
    this.velocity.set(0, 0);
    this.acceleration.set(0, 0);
    this.startPos.set(position);
    outside = false;
    airtime = 0;
    thrown = false;
    hidden = false;
  }

  void setPosition(PVector position) {
    this.position.set(position);
  }

  void setVelocity(PVector velocity) {
    this.velocity.set(velocity);
  }

  void setAcceleration(PVector acceleration) {
    this.acceleration.set(acceleration);
  }

  void resetsize() { //so when dragging mouse and not pressing r, the ball is not tiny
    outside = false;
    airtime = 0;
    thrown = false;
    hidden = false;
  }
  //makes the ball collide with the dog
  void collidedog() {
    if (position.x >= 700 &&
      position.y >= 480) {

      velocity.x *= -1;
      velocity.y *= -1;
    }
  }
}
