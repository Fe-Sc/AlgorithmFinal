
//handles the logic behind dragging and launching the ball with the mouse

class Hand { 
  PImage hand;
  Ball ball;
  PVector mousePos = new PVector();
  PVector position;
  PVector Dragline;
  boolean dragged = false;
  PVector basePos = new PVector(170, 570);


  Hand(PVector position, Ball ball ) {
    hand = loadImage("hand.png");
    this.ball = ball;
    this.position = position;
  }

  void display() {
    //draws the hand

    imageMode(CENTER);
    if (dragged) {
      image(hand, mousePos.x - 70, mousePos.y + 30, 200, 200); //the image follows the mouse position with an offset
    } else {
      image(hand, 100, 600, 200, 200);
    }
  }

  void reset() { //if the ball is resets makes sure the dragging is also reset
    ball.reset(basePos);
    dragged = false;
  }

  void mouseReleasedEvent() {
    if (dragged) {
      // 1. Calculate the direction from the mouse back to the anchor
      PVector launch = PVector.sub(basePos, mousePos);

      // 2. Multiply by a small number to control the speed (sensitivity)
      launch.mult(0.13);

      // 3. Set the ball's velocity and give it gravity
      ball.setVelocity(launch);
      ball.setAcceleration(new PVector(0, 0.5)); // Adding gravity here

      dragged = false;
      ball.thrown = true;
    }
  }
  void mouseDraggedEvent(PVector mouse) {
    dragged = true;
    //if the ball is dragged it follows the mouse
    ball.setPosition(mouse);
    mousePos.set(mouse);
    ball.resetsize();
    ball.setAcceleration(new PVector(0, 0));
    ball.setVelocity(new PVector(0, 0));
    //makes sure that the hand can only be dragged in the bottom right corner
    if (mouse.x > 400 || mouse.y < 350) {
      dragged = false;
      ball.reset(basePos);
    }
  }
}
