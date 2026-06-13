
class Ball {
  PImage ball;
  PVector position = new PVector();
  PVector velocity = new PVector();
  PVector acceleration = new PVector();
  PVector startpos = new PVector();
  float maxdist = 0;
  float airtime = 0;
  boolean thrown = false;

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

  void update() {
    //add here the physics of velocity and position
    velocity.add(acceleration);
    position.add(velocity);
    if (thrown) { //counts airtime since thrown
      airtime += 15;
    }
  }

  void display(boolean isBroken) {
    if (isBroken && position.x > 680 && position.y > 170 && position.y < 470) return; //stop rendering the ball if it is to the right of the window

    imageMode(CENTER);
    float currentSizeW = map(airtime, 0, 800, 120, 1);
    float currentSizeH = map(airtime, 0, 800, 120, 1);
    currentSizeW = constrain(currentSizeW, 20, 150);
    currentSizeH = constrain(currentSizeH, 16, 125);
    image(ball, position.x, position.y, currentSizeW, currentSizeH);
  }



  boolean isOutOfScreen() {
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
    this.maxdist = 0;
    airtime = 0;
    thrown = false;
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
    this.maxdist = 0;
    airtime = 0;
    thrown = false;
  }
}
