// Class managing the game's scoreboard
class Scoreboard {
  int score = 0;

  // Display method for the scoreboard
  void display() {
    fill(0);
    textSize(16);
    textAlign(LEFT);
    text("Score: " + score, 10, 20);
    text("Time: " + ceil(timeLeft / 60.0), 10, 40);
  }

  // Method to increment the score
  void incrementScore() {
    score++;
  }

  // Getter method for the current score
  int getScore() {
    return score;
  }

  // Method to reset the score
  void reset() {
    score = 0;
  }
}
