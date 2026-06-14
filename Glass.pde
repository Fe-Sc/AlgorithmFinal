class Glass {
  Ball ball;
  int hitcount = 0;
  boolean isinside = false; //variable to see if the ball was inside the glass area at the previous frames, so hit is only registered as the ball touches the glass

  void display() {
    if (hitcount < 2) {
      fill(#EDEDED, 180);
      rect(451, 320, 450, 300);
    }
    if (hitcount == 1) {  //make crack appear when hit
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

  void render(PVector ballpos) {
    boolean inside = isHit(ballpos); //check whether the ball is inside the glass area

    if (inside && !isinside) { //count a hit when ball is inside the glass area, and wasnt in the area the previous frame
      hitcount++;
    }

    isinside = inside; //save the current state for the next frame, to compare whether the ball is still inside or outside the glass area
  }

  boolean isHit(PVector ballpos) {
    return (ballpos.x > 230 && ballpos.x < 800 && ballpos.y > 350 && ballpos.y < 400);
  } //returns true if the ball is inside the glass area, and false if it isnt

  void collide(Ball ball) { //checks if ball colides with glass
    if (hitcount <= 2) {
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
    return hitcount >= 2;
  }
}
