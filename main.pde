//Fernando Schintz & Tim Goedejohan

Room room;
Couch couch;

void setup() {
  room = new Room();
  couch = new Couch();
  size(1000, 700);
}

void draw() {
  background(#d8cab5);
  room.display();
  couch.display();

}
