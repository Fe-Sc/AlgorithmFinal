class Couch {
  //making the images variables
  PImage sieb;
  PImage cloth;

  Couch() {
    //loads images needed
    sieb = loadImage("siebster.png");
    cloth = loadImage("kleedje.jpg");
  }

  void display() {
    //displays the blanket
    noStroke();
    beginShape();
    texture(cloth);
    vertex(997, 700, 0, cloth.height);
    vertex(850, 577, cloth.width, 0);
    vertex(655, 577, 0, 0);
    vertex(760, 700, cloth.width, cloth.height);
    endShape(CLOSE);
    //displays the dog
    imageMode(CENTER);
    image(sieb, 770, 600, 200, 200);
  }
}
