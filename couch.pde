class Dog {
  //making the images variables
  PImage sieb;
  PImage cloth;
  float dogWidth;
  float dogHeight;
  PVector dogPos;
  
  Dog(PVector position, float dw, float dh) {
    //loads images needed
    sieb = loadImage("siebster.png");
    cloth = loadImage("kleedje.jpg");
    dogWidth = dw;
    dogHeight = dh;
    dogPos = position;
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
    image(sieb, dogPos.x, dogPos.y, dogWidth, dogHeight);
  }
}
