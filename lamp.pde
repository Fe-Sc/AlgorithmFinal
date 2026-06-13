class Lamp {

  void display() {
    stroke(#000000);
    strokeWeight(5);
    line(500, 0, 500, 100);
    fill(#FFDD62);
    noStroke();
    circle(500, 140, 20);
    fill(#838383);
    beginShape();
    vertex(550, 140);
    vertex(530, 100);
    vertex(470, 100);
    vertex(450, 140);
    endShape();
  }
}
