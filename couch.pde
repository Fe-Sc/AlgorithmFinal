class Couch {
  PImage sieb;
  Couch() {
    sieb = loadImage("siebieblud.png");
  }
  void display() {
    noStroke();
    fill(#861717);
    beginShape();
    vertex(1000, 700);   // Rechtsonder in de hoek van het scherm
    vertex(855, 575);    // Volgt de lijn omhoog naar de binnenwand
    vertex(655, 575);    // 200 pixels naar links (855 - 200)
    vertex(760, 700);    // 200 pixels naar links vanaf de hoek (1000 - 200)
    endShape(CLOSE);
    imageMode(CENTER);
    image(sieb, 800, 550, 200, 200);
  }
}
