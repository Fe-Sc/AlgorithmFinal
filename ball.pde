class Ball {
  PImage ball;
  PVector location = new PVector();
  PVector velocity = new PVector();
  PVector acceleration = new PVector();

  Ball(PVector location, PVector velocity) {
    ball = loadImage("TennisBall.png");
    this.location.set(location);
    this.velocity.set(velocity);
    this.acceleration.set(0,0); 
  }
  
  Ball(PVector location) {
    ball = loadImage("TennisBall.png");
    this.location.set(location);
    this.velocity.set(0,0);
    this.acceleration.set(0,0);
  }
  
    void update() {    
    //add here the physics of velocity and location
    velocity.add(acceleration);
    location.add(velocity);   
  }
  
  void display() {
    imageMode(CENTER);
    //makes the ball smaller/bigger the closer/further it is
    float currentSizeW = map(location.y, 0, 600, 1, 120);
    float currentSizeH = map(location.y, 0, 600, 1, 120); 
    
    // makes sure the ball does not get too big
    currentSizeW = constrain(currentSizeW, 20, 150);
    currentSizeH = constrain(currentSizeH, 16, 125);

    image(ball, location.x, location.y, currentSizeW, currentSizeH);
  }
  
   boolean isOutOfScreen(){
    return (location.x < 0 || 
            location.x > width || 
            location.y < 0 || 
            location.y > height);            
  }
    void reset(PVector location) {
    this.location.set(location);
    this.velocity.set(0,0);
    this.acceleration.set(0,0);
  }

  void setLocation(PVector location) {
    this.location.set(location);
  }

  void setVelocity(PVector velocity) {
    this.velocity.set(velocity);
  }
  
  void setAcceleration(PVector acceleration) {
    this.acceleration.set(acceleration);
  }
}
