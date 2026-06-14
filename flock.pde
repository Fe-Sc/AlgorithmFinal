
class Flock {
  ArrayList<Bird> birds; // create an ArrayList for the birds

  Flock() {
    birds = new ArrayList<Bird>(); // Initialize the ArrayList
  }

  void run() {
    for (Bird b : birds) {
      b.run(birds);  // pass the arraylist to the birds 
    }
  }

  void addBird(Bird b) {
    birds.add(b);
  }
}
