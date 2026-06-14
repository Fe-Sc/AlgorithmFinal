  class Room { //class for the boundaries of the room including the plant and the window
  //makes the images variables 
  PImage pot;
  PImage plant;

  Room() {
    //loads images needed
    pot = loadImage("pot.png");
    plant = loadImage("plant.png");
  }
  void display() {
    stroke(#000000);
    strokeWeight(5);
    rectMode(CENTER);
    fill(#FFFFFF, 0);
    //the rectangle in the middle
    rect(width/2, height/2, (width/2) + 200, (height/2) + 100);
    //lines to the corners of the room
    line(0, 700, 150, 575);
    line(0, 0, 150, 125);
    line(1000, 700, 850, 575);
    line(1000, 0, 850, 125);
    //the windown
    strokeWeight(10);
    fill(#E1F1F7, 0);
    rect(400, 320, 350, 300);
    rect(550, 320, 250, 300);
    //plant pot
    image(pot, 150, 550, 150, 150);
    //plant green part
    image(plant, 150, 362, 300, 300);
    //the bowl
    stroke(#6F6F6F);
    strokeWeight(5);
    line(600, 680, 600, 645);
    line(655, 680, 655, 645);
    fill(#6F6F6F);
    rect(628.5, 672, 54, 15);
  }
}
