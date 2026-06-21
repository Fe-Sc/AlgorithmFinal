//displays the dog and its cloth
class Dog {
  //making the images variables
  PImage dog;
  PImage cloth;
  float dogWidth;
  float dogHeight;
  PVector dogPos;

  
  Dog(PVector position, float dw, float dh) {
    //loads images needed
    dog = loadImage("siebster.png");
    cloth = loadImage("kleedje.jpg");
    dogWidth = dw;
    dogHeight = dh;
    dogPos = position;
  }

  void display() {
    //displays the blanket using coordinates relative to the dog position
    float clothLeft = dogPos.x - 115;
    float clothRight = dogPos.x + 227;
    float clothTop = dogPos.y - 23;
    float clothBottom = dogPos.y + 100;
    float clothTopRight = dogPos.x + 80;
    float clothBottomRight = dogPos.x - 10;

    noStroke();
    beginShape();
    texture(cloth);
    vertex(clothRight, clothBottom, 0, cloth.height);
    vertex(clothTopRight, clothTop, cloth.width, 0);
    vertex(clothLeft, clothTop, 0, 0);
    vertex(clothBottomRight, clothBottom, cloth.width, cloth.height);
    endShape(CLOSE);
    //displays the dog
    imageMode(CENTER);
    image(dog, dogPos.x, dogPos.y, dogWidth, dogHeight);
  }

  //checkes wether the input x and y are inside the area of the dog and returns true or false, for the hair particle system 
  boolean inside(float x, float y) {
    float halfW = dogWidth / 2;
    float halfH = dogHeight / 2;
    return x > dogPos.x - halfW && x < dogPos.x + halfW && y > dogPos.y - halfH && y < dogPos.y + halfH;
  }
}
