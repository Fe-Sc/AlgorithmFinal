class hairSystem{
  ArrayList<hair> hairs;

  hairSystem(){
    hairs = new ArrayList<hair>();
  }
  void makeHair(PVector pos){
    
    hairs.add(new hair(new PVector(pos.x,pos.y)));
  }
  void updateHair(){
  for (int i = hairs.size()-1; i >= 0; i--) {
    hair p = hairs.get(i);
    p.run();
    if (p.isDead()) {
      hairs.remove(i);
    }
  }
}
}

  
