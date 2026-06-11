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

void setup() {
  room = new Room();
  couch = new Couch();
  window = new Window();
  plant = new Plant();
  television = new Television();
  ball = new Ball(new PVector(170, 570));
  hand = new Hand(new PVector(100, 550), ball);
  lamp = new Lamp();

  size(1000, 700, P2D);
}

void draw() {
  background(#d8cab5);
  room.display();
  window.display();
  couch.display();
  plant.display();
  television.display();
  ball.update();
  ball.display();
  hand.display();
  lamp.display();
  couch.update();
}

void mouseDragged() {
  hand.mouseDraggedEvent(new PVector(mouseX, mouseY));
  
}

void mouseReleased() {
  hand.mouseReleasedEvent();
  
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    hand.reset();
  }
}
