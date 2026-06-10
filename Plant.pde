class Plant {
  PImage pot;
  PImage plant;

  Plant() {
    pot = loadImage("pot.png");
    plant = loadImage("plant.png");
  }

  void display() {

    image(pot, 200, 550, 150, 150);
    image(plant, 200, 362, 300, 300);
  }
}
