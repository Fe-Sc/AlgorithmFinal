//particle system partially based on code by Daniel Shiffman, modified and adjusted by Fernando Schintz and Tim Goedejohan
//handels the array of particles/hairs
class hairSystem {
  ArrayList<hair> hairs;
  Watermanagement wm;

  hairSystem(Watermanagement wm) {
    hairs = new ArrayList<hair>();
    this.wm = wm;
  }
  void makeHair(PVector pos) {
    hairs.add(new hair(new PVector(pos.x, pos.y), glass, wm)); //add a new hair to the arraylist, at position pos.x and pos.y and passes glass and watermanager object
  }
  void updateHair() {
    for (int i = hairs.size()-1; i >= 0; i--) {
      hair p = hairs.get(i);
      p.run();
      if (p.isDead()) {   //removes hair from arraylist if lifespan is less than 0
        hairs.remove(i);
      }
    }
  }
}
