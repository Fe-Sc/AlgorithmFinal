//Fernando Schintz & Tim Goedejohan
//s3686337, s3706877
Room room;
Couch couch;
Window window;
Plant plant;
Television television;
Hand hand;
Lamp lamp;
Ball ball;
hairSystem hs;
Glass glass;
Flock flock;
Sky sky;

void setup() {
  size(1000, 700, P2D);
  room = new Room();
  couch = new Couch();
  window = new Window();
  plant = new Plant();
  television = new Television();
  ball = new Ball(new PVector(170, 570));
  hand = new Hand(new PVector(100, 550), ball);
  lamp = new Lamp();
  glass = new Glass();
  hs = new hairSystem();
  sky = new Sky();
  flock = new Flock();
  for (int i = 0; i < 6; i++) { //generate six birds when running program
    Bird bird = new Bird(width/2, height/2);
    flock.addBird(bird);
  }
}

void draw() {
  background(#d8cab5);
  room.display();
  window.display();
  sky.display();
  flock.run();
  couch.display();
  glass.display();
  glass.render(ball.position);
  glass.collide(ball);
  plant.display();
  television.display();
  television.render();
  ball.update();
  ball.display(glass.isBroken());
  hand.display();
  lamp.display();

  println(mouseX, mouseY);
  hs.updateHair();
}



void mouseDragged() {
  hand.mouseDraggedEvent(new PVector(mouseX, mouseY));
  if (mouseX > 711 && mouseX < 860  && mouseY > 520 && mouseY < 676) { //only if mouse is on the dog
    hs.makeHair(new PVector(mouseX, mouseY));
  }
}

void mouseReleased() {
  hand.mouseReleasedEvent();
}

void mousePressed() {
  television.click(mouseX, mouseY);
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    hand.reset();
  }
}
