//renders the television and its perlin noise
class Television {
  float t = 0; // time offset for z-coordinate in noise space
  boolean isOn = false;
  float leftBound;
  float rightBound;
  float topBound;
  float bottomBound;  // screen bounds
  float centerX;
  float centerY;  // Base coordinates around the center of the tv

  Television(float leftBound, float rightBound, float topBound, float bottomBound, float centerX, float centerY) {
    this.leftBound = leftBound;
    this.rightBound = rightBound;
    this.topBound = topBound;
    this.bottomBound = bottomBound;
    this.centerX = centerX;
    this.centerY = centerY;
    this.t = 0;
    this.isOn = false;
  }

  void display() {
    fill(#000000);
    noStroke();
    rect(centerX, centerY + 50, 60, 30);
    strokeWeight(5);
    stroke(#838383);
    rectMode(CENTER);
    rect(centerX, centerY, 180, 100);
    fill(#AA7A00);
    noStroke();
    stroke(#745300);
    rect(centerX - 50, centerY + 115, 360, 100);
    line(centerX - 110, centerY + 65, centerX - 110, centerY + 165);
    line(centerX + 10, centerY + 65, centerX + 10, centerY + 165);
    line(centerX - 210, centerY + 105, centerX - 210, centerY + 125);
    line(centerX - 90, centerY + 105, centerX - 90, centerY + 125);
    line(centerX + 30, centerY + 105, centerX + 30, centerY + 125);
  }

  void render() { //function to render the perlin noise of the static
    if (!isOn) return;
    noStroke();
    for (int y = (int)topBound; y < (int)bottomBound; y++) {
      for (int x = (int)leftBound; x < (int)rightBound; x++) {
        float n = noise(x * 0.1, y * 0.1, t) * 255; //multiply by 0.1 to scale down the coordinates so neighboring pixels would be more similar (perlin noise is a map), then scale by 255 for color values
        fill(n); //fille the rect with the color of the noise, 0 is black, 255 is white
        rect(x, y, 1, 1);
      }
    }
    t += 0.05; // every frame move z coordinate by a value of 0.05
  }

  void click(int mx, int my) {
    if (mx > leftBound && mx < rightBound && my > topBound && my < bottomBound) {
      isOn = !isOn;
    }
  }
}
