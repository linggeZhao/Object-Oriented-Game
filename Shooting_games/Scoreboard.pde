class Scoreboard {
  int score = 0;

  void display() {
    fill(0);
    textSize(16);
    textAlign(LEFT);
    text("Score: " + score, 10, 20);
    text("Time: " + ceil(timeLeft / 60.0), 10, 40);
  }

  void incrementScore() {
    score++;
  }

  int getScore() {
    return score;
  }

  void reset() {
    score = 0;
  }
}
