class Watermanagement {
  float mass = 2;
  float springConstant = 0.1;
  float damping = 0.98;
  int leftBound = 600;
  int rightBound = 655;
  int topBound = 645;
  int bottomBound = 680;
  int bowlThickness = 15;
  WaterSystem[] watersystems;

  //fill array with objects
  Watermanagement() {
    watersystems = new WaterSystem[10];
    for (int i = 0; i < watersystems.length; i++) {
      float offset = 600 + (i * 6); //acts as the distance between individual water segments
      watersystems[i] = new WaterSystem(mass, springConstant, damping, new PVector(offset, 650));
    }
  }

  void run() {

    //for calculating the height difference between members and neighbors
    for (int i = 0; i< watersystems.length - 1; i++) {
      float distanceDiff = watersystems[i+1].displacement - watersystems[i].displacement; //calculates the difference of vertical displacement between a member and its neighbor

      watersystems[i].calculateNeighbourForce(distanceDiff);

      watersystems[i+1].calculateNeighbourForce(-distanceDiff); //if neighbor position is under that of the member it is compared to, it should bob up
    }
    for (WaterSystem s : watersystems) {
      s.update();
    }
    //generating the shape
    fill(#5DAFDF);
    noStroke();
    beginShape();

    // place a vertex point at the top of each wave
    for (int i = 0; i < watersystems.length; i++) {
      vertex(watersystems[i].position.x, watersystems[i].position.y + watersystems[i].displacement);
    }

    // fill the wave at the bottom left and bottom right corner
    vertex(watersystems[watersystems.length - 1].position.x, bottomBound);
    vertex(watersystems[0].position.x, bottomBound);
    endShape(CLOSE);

        //the bowl
    rectMode(CENTER);
    stroke(#6F6F6F);
    strokeWeight(5);
    line(leftBound, bottomBound, leftBound, topBound);
    line(rightBound, bottomBound, rightBound, topBound);
    fill(#6F6F6F);
    rect((leftBound + rightBound) /2, bottomBound - 8, rightBound-leftBound, bowlThickness);
  }

  
  void click(int watermx, int watermy) { //give a wave force
    if (watermx > leftBound && watermx < rightBound && watermy > topBound && watermy < bottomBound) {
      int wave = int(random(0, 10));
      watersystems[wave].force = 10;
    }
  }
}
