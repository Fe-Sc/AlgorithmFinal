class Television{
  float t = 0; // time offset for z-coordinate in noise space
  boolean isOn = false;
  void display(){
    fill(#000000);
    noStroke();
    rect(550, 500, 60, 30);
    strokeWeight(5);
    stroke(#838383);
    rectMode(CENTER);
    rect(550, 450, 180, 100);
    fill(#AA7A00);
    noStroke();
    stroke(#745300);
    rect(500, 565, 360, 100);
    line(440, 515, 440, 615);
    line(560, 515, 560, 615);
    line(340, 555, 340, 575);
    line(460, 555, 460, 575);
    line(580, 555, 580, 575);
    

  }
  
  void render(){ //function to render the perlin noise of the static
  if (!isOn) return;
    noStroke();
     for (int y = 401; y <497; y++){
       for (int x = 463; x < 639; x++){
         float n = noise(x * 0.1, y * 0.1, t) * 255; //multiply by 0.1 to scale down the coordinates so neighboring pixels would be more similar (perlin noise is a map), then scale by 255 for color values
         fill(n); //fille the rect with the color of the noise, 0 is black, 255 is white
         rect(x, y, 1, 1);
       }
     }
     t += 0.05; // every frame move z coordinate by a value of 0.05
  }
  
  void click(int mx, int my){
    if (mx > 463 && mx < 639 && my > 401 && my < 497){
      isOn = !isOn;
    }
  }
}
