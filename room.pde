class Room {

  void display() {
    stroke(#000000);
    strokeWeight(5);
    rectMode(CENTER);
    fill(#d4c5ad);
    rect(width/2, height/2, (width/2) + 200, (height/2) + 100);
    line(0, 700, 150, 575);
    line(0, 0, 150, 125);
    line(1000, 700, 850, 575);
    line(1000, 0, 850, 125);
  }
}
