//Fernando Schintz & Tim Goedejohan
//s3686337, s3706877
//photos used:
//the photo of the dog and the photo of the hand made by ourselves
//the pot: https://www.magnific.com/free-photo/empty-terracotta-clay-plant-pot_16238540.htm#fromView=search&page=1&position=1&uuid=c8495cb9-a492-444a-baa3-86db1b033db2&query=Empty+flower+pot
//the plant: https://www.magnific.com/free-psd/lush-green-dracaena-plant-elegant-white-pot-perfect-indoor-greenery_409089784.htm#fromView=search&page=1&position=1&uuid=4ba35584-8600-429e-90d6-6b01ab22940d&query=plant+?log-in=google
//the bird: https://www.magnific.com/free-photo/white-bird-flying-sea_14501401.htm#fromView=search&page=1&position=3&uuid=ca5ef1a5-bc7c-49df-8670-4c51dad2c779&query=bird+flying
//fabric texture: https://www.magnific.com/free-photo/fabric-texture-background_1161816.htm#fromView=search&page=1&position=8&uuid=7ab45240-6ad9-4920-8d6e-881538ca5269&query=Flat+rug+fabric+texture


//making the variables
Room room;
Couch couch;
Television television;
Hand hand;
Lamp lamp;
Ball ball;
hairSystem hs;
Glass glass;
Flock flock;
Sky sky;
Painting painting;
Watermanagement water;

//seting up the screen and creating the objects
void setup() {
  size(1000, 700, P2D); //setting up the size and making the program use the graphics card
  //creating objects
  room = new Room();
  couch = new Couch();
  television = new Television();
  ball = new Ball(new PVector(170, 570));  //sets up the ball in the start position
  hand = new Hand(new PVector(100, 550), ball); //gives the hand a start postition and the ability to interact with the ball
  lamp = new Lamp();
  glass = new Glass();
  hs = new hairSystem();
  sky = new Sky();
  flock = new Flock();
  painting = new Painting(720, 200, 100, 200); //spawns the painting in a certain place
  water = new Watermanagement();
  for (int i = 0; i < 30; i++) { // Generate six birds when running program
    Bird bird = new Bird(width/2, height/2);
    flock.addBird(bird);
  }
}

//draws the objects
void draw() {
  background(#d8cab5); //creates a background beige color
  water.run();
  room.display();
  sky.display();
  flock.run();
  couch.display();
  glass.display();
  glass.render(ball.position);
  glass.collide(ball);
  television.display();
  television.render();
  ball.update(glass.isBroken());
  ball.display(glass.isBroken());
  ball.collidedog();
  hand.display();
  lamp.display();
  hs.updateHair();
  painting.display();
}

void mouseDragged() {
  hand.mouseDraggedEvent(new PVector(mouseX, mouseY)); //makes the position of the mouse a vector
  if (mouseX > 711 && mouseX < 860  && mouseY > 520 && mouseY < 676) { //makes hairs only if mouse is on the dog
    hs.makeHair(new PVector(mouseX, mouseY));
  }
}

void mouseReleased() {
  hand.mouseReleasedEvent(); //shoots the ball when the mouse is released
}

void mousePressed() {
  television.click(mouseX, mouseY); //checks if TV is clicked
  water.click(mouseX, mouseY); //checks if the water is clicked
}

//resets the ball using r or R
void keyPressed() {
  if (key == 'r' || key == 'R') {
    hand.reset();
  }
}
