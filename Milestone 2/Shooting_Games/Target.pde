// Class representing the target objects in the game
class Target {
  float x, y;
  float diameter;
  float speed = 1; // Speed of target movement

  // Constructor initializing target properties
  Target() {
    reset();
  }

  // Method to reset target position and diameter
  void reset() {
    x = random(width);
    y = random(height);
    diameter = random(20, 50);
  }

  // Method to move the target left and right
  void move() {
    x += speed;
    if (x < 0 || x > width) {
      speed *= -1; // Reverse movement direction if the target reaches the edge
    }
  }

  // Method to display the target
  void display() {
    noStroke();
    fill(255, 0, 0);
    ellipse(x, y, diameter, diameter);
    fill(255);
    ellipse(x, y, diameter - 10, diameter - 10);
    fill(255, 0, 0);
    ellipse(x, y, diameter - 20, diameter - 20);
  }

  // Method to check if the target is hit by the mouse pointer
  boolean hit(float px, float py) {
    float distance = dist(px, py, x, y);
    return distance < diameter / 2;
  }
}
