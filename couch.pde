class Couch {

  PImage sieb;
  PImage cloth;
  PVector pos = new PVector(350, 400);
  Couch() {
    sieb = loadImage("siebster.png");
    cloth = loadImage("kleedje.jpg");

    this.pos.set(pos);
  }

  void display() {
    noStroke();
    beginShape();
    texture(cloth);
    vertex(997, 700, 0, cloth.height);
    vertex(850, 577, cloth.width, 0);
    vertex(655, 577, 0, 0);
    vertex(760, 700, cloth.width, cloth.height);
    endShape(CLOSE);
    imageMode(CENTER);
    image(sieb, 770, 600, 200, 200);
  }
}
