class Hand {
  PImage hand;
  Ball ball;
  PVector mousePos = new PVector();
  PVector position;
  PVector Dragline;
  boolean dragged = false; 
  PVector basePos = new PVector(170, 570); //<>//

  Hand(PVector position, Ball ball ) {
    hand = loadImage("hand.png");
    this.ball = ball; 
    this.position = position;
  }

  void display() {
    imageMode(CENTER);
    //image(hand, 100, 600, 200, 200);
    image(hand, mousePos.x, mousePos.y, 200, 200);
  }
  
    void reset() {
   ball.reset(basePos);
    dragged = false;
  }
  
    void mouseReleasedEvent() {
   if (dragged){
     // 1. Calculate the direction from the mouse back to the anchor
      PVector launch = PVector.sub(basePos, mousePos);
      
      // 2. Multiply by a small number to control the speed (sensitivity)
      launch.mult(0.15); 
      
      // 3. Set the ball's velocity and give it gravity
      ball.setVelocity(launch);
      ball.setAcceleration(new PVector(0, 0.2)); // Adding gravity here
      
      dragged = false;  
   }
  }
    void mouseDraggedEvent(PVector mouse){
  dragged = true;
    ball.setLocation(mouse);
    mousePos.set(mouse);
  ball.setAcceleration(new PVector(0, 0));
  ball.setVelocity(new PVector(0, 0));
  }
}
