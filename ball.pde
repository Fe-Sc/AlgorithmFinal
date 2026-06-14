
class Ball {
  PImage ball;
  PVector position = new PVector();
  PVector velocity = new PVector();
  PVector acceleration = new PVector();
  PVector startpos = new PVector();
  float airtime = 0;
  boolean thrown = false;
  boolean outside = false;
  boolean hidden = false;

  Ball(PVector position, PVector velocity) {
    ball = loadImage("TennisBall.png");
    this.position.set(position);
    this.velocity.set(velocity);
    this.acceleration.set(0, 0);
  }

  Ball(PVector position) {
    ball = loadImage("TennisBall.png");
    this.position.set(position);
    this.velocity.set(0, 0);
    this.acceleration.set(0, 0);
  }

  void update(boolean isBroken) {
    //add here the physics of velocity and position
    velocity.add(acceleration);
    position.add(velocity);
    if (thrown) { //counts airtime since thrown
      airtime += 15;
    }
    
    if (position.y < 450 && position.x >= 230 && position.x <= 670){ //if the ball is inside the bounds of the window, it is outside
      outside = true;
    }
    //hide the ball if it is outside, and outside the boundaries of the window
    if (isBroken && position.x > 680 && position.y > 170 && position.y < 470) hidden = true;
    if (isBroken && outside && position.y >= 450 && position.x >= 230 && position.x <= 670) hidden = true;
  }
  

  void display(boolean isBroken) {
    if (hidden) return; //if hidden is true, stop rendering the ball by exiting the method early
    if (isBroken && position.x > 680 && position.y > 170 && position.y < 470) return; //stop rendering the ball if it is to the right of the window
    
    if (isBroken && outside && position.y >= 460 && position.x >= 230 && position.x <= 670) return; // stop rendering the ball if it is outisde and out of the borders of the window so it looks like the ball falls behind the walls
    
    imageMode(CENTER);
    float currentSizeW = map(airtime, 0, 800, 120, 1);   //maps the airtime variable with the currentsize variable
    float currentSizeH = map(airtime, 0, 800, 120, 1);
    currentSizeW = constrain(currentSizeW, 50, 150); //constrain the value of current size so the ball doesnt get smaller than those values
    currentSizeH = constrain(currentSizeH, 40, 125);
    image(ball, position.x, position.y, currentSizeW, currentSizeH);
  }



  boolean isOutOfScreen() { //check if the ball is out of screen
    return (position.x < 0 ||
      position.x > width ||
      position.y < 0 ||
      position.y > height);
  }
  void reset(PVector position) {
    this.position.set(position);
    this.velocity.set(0, 0);
    this.acceleration.set(0, 0);
    this.startpos.set(position);
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
}
