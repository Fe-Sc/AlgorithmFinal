class Couch {
  PImage sieb;
  PImage cloth;
  Couch() {
    sieb = loadImage("siebster.png");
    cloth = loadImage("kleedje.jpg");
  }
  void display() {
    noStroke();
    //fill(#861717);
    beginShape();
    texture(cloth);
    vertex(997, 700, 0, cloth.height);   // Rechtsonder in de hoek van het scherm
    vertex(850, 577, cloth.width, 0);    // Volgt de lijn omhoog naar de binnenwand
    vertex(655, 577, 0, 0);    // 200 pixels naar links (855 - 200)
    vertex(760, 700, cloth.width, cloth.height);    // 200 pixels naar links vanaf de hoek (1000 - 200)
    endShape(CLOSE);
    imageMode(CENTER);
    image(sieb, 770, 600, 200, 200);
  }
}
