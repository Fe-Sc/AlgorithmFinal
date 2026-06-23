////Flocking code based on flocking code (boids flocking) by Daniel Shiffman, modified and used by Fernando Schintz and Tim Goedejohan

//handles the array for flocking

class Flock {
  Bird[]  birds;
  int birdCount = 0;

  Flock(int maxBirds) {
    birds = new Bird[maxBirds]; // Initialize the Array
    for (int i = 0; i < birds.length; i++) { // Generate birds at the start, amount equal to birdCount
      Bird bird = new Bird(width/2, height/2);
      addBird(bird);
    }
  }

  void run() {
    for (int i = 0; i < birdCount; i++) {
      birds[i].run(birds, birdCount);
    }
  }

  //add birds
  void addBird(Bird b) {
    if (birdCount < birds.length) {
      birds[birdCount] = b;
      birdCount++;
    }
  }
}
