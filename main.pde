//Fernando Schintz & Tim Goedejohan
//s3686337, s3706877
Room room;
Couch couch;
Window window;
Plant plant;

void setup() {
  room = new Room();
  couch = new Couch();
  window = new Window();
  plant = new Plant();
  size(1000, 700, P2D);
}

void draw() {
  background(#d8cab5);
  room.display();
  window.display();
  couch.display();
  plant.display();

}
