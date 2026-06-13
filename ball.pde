class Ball {
  PImage ball;
  PVector position = new PVector();
  PVector velocity = new PVector();
  PVector acceleration = new PVector();
  PVector startpos = new PVector();
  float maxdist = 0;

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

    float d = PVector.dist(position, startpos);
    if (d > maxdist) {
      maxdist = d;
    }
    println(maxdist);
  }

  void display() {
    imageMode(CENTER);
    //makes the ball smaller/bigger the closer/further it is
    float currentSizeW = map(maxdist + (startpos.y - position.y), 0, 800, 120, 1);
    float currentSizeH = map(maxdist + (startpos.y - position.y), 0, 800, 120, 1);

    // makes sure the ball does not get too big
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
  }
}
