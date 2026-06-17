class Glass {
  Ball ball;
  int hitCount = 0;
  boolean isInside = false; //variable to see if the ball was inside the glass area at the previous frames, so hit is only registered as the ball touches the glass

  void display() {

    strokeWeight(10);
    fill(#E1F1F7, 0);
    rect(400, 320, 350, 300);
    rect(550, 320, 250, 300);

    if (hitCount < 2) {
      fill(#EDEDED, 180);
      rect(451, 320, 450, 300);
    }
    if (hitCount == 1) {  //make crack appear when hit
      stroke(#858585);
      strokeWeight(1);
      line(456, 373, 319, 244);
      line(449, 370, 594, 260);
      line(454, 370, 601, 350);
      line(452, 370, 611, 380);
      line(453, 370, 482, 225);
      line(453, 370, 313, 460);
      line(454, 370, 477, 440);
      noStroke();
    }
  }

  void render(PVector ballPos) {
    boolean inside = isHit(ballPos); //check whether the ball is inside the glass area

    if (inside && !isInside) { //count a hit when ball is inside the glass area, and wasnt in the area the previous frame
      hitCount++;
    }

    isInside = inside; //save the current state for the next frame, to compare whether the ball is still inside or outside the glass area
  }

  boolean isHit(PVector ballPos) {
    return (ballPos.x > 230 && ballPos.x < 800 && ballPos.y > 350 && ballPos.y < 400);
  } //returns true if the ball is inside the glass area, and false if it isnt

  void collide(Ball ball) { //checks if ball colides with glass
    if (hitCount <= 2) {
      if (ball.position.x > 230 &&
        ball.position.x < 800 &&
        ball.position.y > 320 &&
        ball.position.y < 400) {

        //ball bounces back when it hits the glass
        ball.velocity.x *= -0.9;
        ball.velocity.y *= -0.9;
      }
    }
  }

  boolean isBroken() { //glass breaks if it is hit twice
    return hitCount >= 2;
  }
}
