class Painting {
  float x, y, w, h;

  //array to have the cords
  float[] xCoords;

  int totalLines = 300;

  Painting(float xPos, float yPos, float wSize, float hSize) {
    x = xPos;
    y = yPos;
    w = wSize;
    h = hSize;

    xCoords = new float[totalLines];

    float midX = x + (w / 2);
    float sd = w * 0.12; // Controls the bell curve width

    // Calculate the single X position for each line
    for (int i = 0; i < totalLines; i++) {
      xCoords[i] = midX + ((float) randomGaussian() * sd);
    }
  }

  void display() {
    // Draw the background frame
    rectMode(CORNER);
    stroke(40);
    strokeWeight(5);
    fill(20);
    rect(x, y, w, h);

    // Top and bottom boundaries for the lines
    float topY = y + 5;
    float bottomY = (y + h) - 5;

    stroke(0, 180, 255, 25); // Transparent blue
    strokeWeight(1.5); // Slightly thicker lines look better when perfectly parallel

    for (int i = 0; i < totalLines; i++) {
      // Keep the lines inside the left and right frame borders
      if (xCoords[i] > x + 5 && xCoords[i] < (x + w) - 5) {
        // Pass the exact same X coordinate to both points of the line
        line(xCoords[i], topY, xCoords[i], bottomY);
      }
    }
  }
}
