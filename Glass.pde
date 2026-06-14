class Glass {
  Ball ball;
  int hitcount = 0;
  boolean isinside = false; //variable to see if the ball was inside the glass area at the previous frames

  void display() {
    if (hitcount < 2) {
      fill(#EDEDED, 180);
      rect(451, 320, 450, 300);

      fill(#000000);
    }
    if (hitcount == 1) {
      stroke(#BCBCBC);
      strokeWeight(2);
      line(551, 370, 450, 280);
      line(551, 370, 600, 260);
      line(553, 370, 456, 350);
      line(550, 370, 643, 380);
      line(550, 370, 631, 450);
      line(550, 370, 493, 460);
      line(550, 370, 445, 420);
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
    return (ballpos.x > 400 && ballpos.x < 800 && ballpos.y > 320 && ballpos.y < 620);
  } //returns true if the ball is inside the glass area, and false if it isnt

  void collide(Ball ball) {
    if (hitcount < 2) {
      if (ball.position.x > 400 &&
        ball.position.x < 800 &&
        ball.position.y > 320 &&
        ball.position.y < 620) {

        ball.velocity.x *= -0.9;
        ball.velocity.y *= -0.9;
      }
    }
  }
  boolean isBroken() {
    return hitcount >= 2;
  }
}
