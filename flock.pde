////Flocking code based on flocking code (boids flocking) by Daniel Shiffman, modified and used by Fernando Schintz and Tim Goedejohan
class Flock {
  Bird[]  birds;
  int birdCount = 0;

  Flock(int maxBirds) {
    birds = new Bird[maxBirds]; // Initialize the Array
  }

void run() {
  for (int i = 0; i < birdCount; i++) {
    birds[i].run(birds, birdCount);  
  }
}


  void addBird(Bird b) {
    if (birdCount < birds.length){
      birds[birdCount] = b;
      birdCount++;
    }
  }
}
