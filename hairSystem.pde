class hairSystem {
  ArrayList<hair> hairs;

  hairSystem() {
    hairs = new ArrayList<hair>();
  }
  void makeHair(PVector pos) {
    hairs.add(new hair(new PVector(pos.x, pos.y))); //add a new hair to the arraylist, at position pos.x and pos.y
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
