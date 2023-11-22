class Target {
  float x, y;
  float diameter;

  Target() {
    reset();
  }

  void reset() {
    x = random(width);
    y = random(height);
    diameter = random(20, 50);
  }

  void display() {
    noStroke();
    fill(255, 0, 0);
    ellipse(x, y, diameter, diameter);
    fill(255);
    ellipse(x, y, diameter - 10, diameter - 10);
    fill(255, 0, 0);
    ellipse(x, y, diameter - 20, diameter - 20);
  }

  boolean hit(float px, float py) {
    float distance = dist(px, py, x, y);
    return distance < diameter / 2;
  }
}
