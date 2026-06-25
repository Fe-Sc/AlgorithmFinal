
//handles the physics, rendering, and state management of the tennis ball

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
  float currentSizeW;
  float currentSizeH;
  Glass glass;

  //constructor that gives starting position and starting velocity
  Ball(PVector position, PVector velocity, Glass glass) {
    //gives the ball an image
    ball = loadImage("TennisBall.png");
    this.position.set(position);
    this.velocity.set(velocity);
    //starts with no acceleration
    this.acceleration.set(0, 0);
    this.glass = glass;
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


    if (position.y < glass.glassBottom && position.x >= glass.glassLeft && position.x <= glass.glassRight) { //if the ball is inside the bounds of the window, it is outside
      outside = true;
    }



    if (isBroken && outside && (
      position.x > glass.glassRight ||   // flew out the right
      position.x < glass.glassLeft  ||   // flew out the left
      position.y > glass.glassBottom        // flew out the top
      )) hidden = true;
    }


    void display() {
      if (hidden) return; //if hidden is true, stop rendering the ball by exiting the method early


      imageMode(CENTER);
      currentSizeW = map(airtime, 0, 800, 120, 1); //maps the airtime variable with the currentsize variable
      currentSizeH = map(airtime, 0, 800, 120, 1);
      currentSizeW = constrain(currentSizeW, 70, 150); //constrain the value of current size so the ball doesnt get smaller than those values
      currentSizeH = constrain(currentSizeH, 50, 125);
      image(ball, position.x, position.y, currentSizeW, currentSizeH); //makes the ball using the size and position that are caculated
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
    void collidedog(Dog dog) {
      if (position.x >= dog.dogPos.x - dog.dogWidth/2 &&
        position.x <= dog.dogPos.x + dog.dogWidth/2 &&
        position.y >= dog.dogPos.y - dog.dogHeight/2 &&
        position.y <= dog.dogPos.y + dog.dogHeight/2) {

        velocity.x *= -1;
        velocity.y *= -1;
      }
    }
  }
