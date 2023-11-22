int screenWidth = 400;
int screenHeight = 400;

int maxSimultaneousTargets = 5;
ArrayList<Target> targets;
Gun sniperRifle;
Scoreboard scoreboard;
boolean gameRunning = false;
int timeLeft = 15 * 60; // 15 seconds
boolean gameEnded = false;
int targetsHit = 0;
boolean inBackpack = false;

PVector backpackIconPosition; // Declare backpackIconPosition

void settings() {
  size(screenWidth, screenHeight);
}

void setup() {
  targets = new ArrayList<Target>();
  sniperRifle = new Gun("Default Rifle", "Default Scope");
  scoreboard = new Scoreboard();
  noCursor(); // Hide the mouse cursor initially

  // Initialize the backpack icon position
  backpackIconPosition = new PVector(width - 50, 25);
}

void draw() {
  // Draw the background gradient from pink to orange
  for (int y = 0; y < height; y++) {
    // Calculate a color between pink and orange based on y-coordinate
    float inter = map(y, 0, height, 0, 1);
    color c = lerpColor(color(255, 192, 203), color(255, 165, 0), inter);
    stroke(c);
    line(0, y, width, y);
  }

  if (gameRunning) {
    timeLeft--;

    if (timeLeft <= 0) {
      endGame(); // Trigger endGame when time runs out
    } else {
      if (targetsHit >= maxSimultaneousTargets) {
        // Generate a new set of targets if all current targets are hit
        targets.clear();
        for (int i = 0; i < maxSimultaneousTargets; i++) {
          targets.add(new Target());
        }
        targetsHit = 0;
      }

      for (Target target : targets) {
        target.display();
      }

      sniperRifle.display();
      scoreboard.display();
    }
  } else {
    fill(0);
    textSize(32);
    textAlign(CENTER, CENTER);
    if (gameEnded) {
      if (scoreboard.getScore() >= maxSimultaneousTargets) {
        text("You win!", width / 2, height / 2);
      } else {
        text("Game over", width / 2, height / 2);
      }
      cursor(); // Show the mouse cursor when the game ends
    } else {
      text("Click to start", width / 2, height / 2);
    }

    // Draw the backpack icon in the start interface
    drawBackpack(backpackIconPosition.x, backpackIconPosition.y, 40, 60);
  }

  if (inBackpack) {
    // Draw backpack screen
    drawBackpackScreen();
  }
}

void drawBackpack(float x, float y, float width, float height) {
  // Draw a simple representation of a backpack using basic shapes
  fill(100, 100, 100);
  rect(x, y, width, height);
  fill(150, 150, 150);
  rect(x + 10, y + 10, width - 20, height - 20);
  fill(0);
  ellipse(x + width / 2, y + height / 2, width - 10, height - 10);

  // Draw straps for the backpack
  fill(100, 100, 100);
  rect(x + 10, y + height / 3, width - 20, height / 10);
  rect(x + 15, y + height / 3 - 10, 10, height / 3);
  
  // Add the text "bag" on the backpack
  fill(255);
  textSize(12);
  textAlign(CENTER, CENTER);
  text("bag", x + width / 2, y + height / 2 + 5);
}

void drawBackpackScreen() {
  // Draw backpack screen content
  background(200);
  fill(0);
  textSize(24);
  textAlign(CENTER, CENTER);
  text("Backpack", width / 2, 30);

  // Display gun and scope information in the backpack screen
  text("Gun Type: " + sniperRifle.getType(), width / 2, height / 2 - 40);
  text("Scope Type: " + sniperRifle.getScopeType(), width / 2, height / 2 - 10);

  // Draw the backpack icon in the backpack screen
  drawBackpack(backpackIconPosition.x, backpackIconPosition.y, 40, 60);

  text("Click anywhere to close the backpack", width / 2, height - 30);
}

void mousePressed() {
  float backpackX = backpackIconPosition.x;
  float backpackY = backpackIconPosition.y;
  float backpackWidth = 40;
  float backpackHeight = 60;

  if (inBackpack) {
    inBackpack = false;
    cursor(); // Show the mouse cursor when leaving the backpack
  } else if (mouseX > backpackX && mouseX < backpackX + backpackWidth &&
    mouseY > backpackY && mouseY < backpackY + backpackHeight) {
    if (!gameRunning) {
      if (gameEnded) {
        startGame();
      } else {
        inBackpack = true;
        noCursor(); // Hide the mouse cursor when in the backpack
      }
    }
  } else if (!gameRunning) {
    startGame();
  } else {
    for (Target target : targets) {
      if (target.hit(mouseX, mouseY)) {
        scoreboard.incrementScore();
        targetsHit++;
        target.reset();
      }
    }
  }
}

void startGame() {
  gameRunning = true;
  timeLeft = 15 * 60;
  scoreboard.reset();
  gameEnded = false;
  targets.clear();

  for (int i = 0; i < maxSimultaneousTargets; i++) {
    targets.add(new Target());
  }
  targetsHit = 0;

  noCursor();
}

void endGame() {
  gameRunning = false;
  gameEnded = true;
  cursor();
}
