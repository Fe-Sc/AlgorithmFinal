class Watermanagement {
  float mass = 2;
  float springConstant = 0.1;
  float damping = 0.98;

  system[] watersystems;

  //fill array with objects
  Watermanagement() {
    watersystems = new system[10];
    for (int i = 0; i < watersystems.length; i++) {
      float offset = 600 + (i * 6);
      watersystems[i] = new system(mass, springConstant, damping, new PVector(offset, 650));
    }
  }

  void run() {

    //for calculating the height difference between members and neighbors
    for (int i = 0; i< watersystems.length - 1; i++) {
      float distanceDiff = watersystems[i+1].displacement - watersystems[i].displacement; //calculates the difference of vertical displacement between a member and its neighbor

      watersystems[i].calculateNeighbourForce(distanceDiff);

      watersystems[i+1].calculateNeighbourForce(-distanceDiff); //if neighbor position is under that of the member it is compared to, it should bob up
    }
    for (system s : watersystems) {
      //s.render();
      s.update();
    }
    //generating the shape
    fill(#00008b);
    noStroke();
    beginShape();

    // place a vertex point at the top of each wave
    for (int i = 0; i < watersystems.length; i++) {
      vertex(watersystems[i].position.x, watersystems[i].position.y + watersystems[i].displacement);
    }

    // fill the wave at the bottom left and bottom right corner
    vertex(watersystems[watersystems.length - 1].position.x, 680);
    vertex(watersystems[0].position.x, 680);
    endShape(CLOSE);
  }

  void click(int watermx, int watermy) { //give a wave force
    if(watermx > 600 && watermx < 655 && watermy > 645 && watermy < 680){
    int wave = int(random(0, 10));
    watersystems[wave].force = 10;
    }
  }
}
  // line(600, 680, 600, 645);
    //line(655, 680, 655, 645);
    //fill(#6F6F6F);
    //rect(628.5, 672, 54, 15);
