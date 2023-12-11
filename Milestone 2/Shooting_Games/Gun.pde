// Class defining the Gun object with its properties and display method
class Gun {
  String type;
  String scopeType;

  // Constructor initializing Gun properties
  Gun(String type, String scopeType) {
    this.type = type;
    this.scopeType = scopeType;
  }

  // Display method for the Gun object
  void display() {
    fill(0);
    rectMode(CENTER);
    rect(mouseX, height - 10, 10, 40);
    rect(mouseX, height - 30, 20, 10);

    stroke(0);
    line(mouseX - 10, mouseY, mouseX + 10, mouseY);
    line(mouseX, mouseY - 10, mouseX, mouseY + 10);
  }

  // Getter method for Gun type
  String getType() {
    return type;
  }

  // Getter method for Gun scope type
  String getScopeType() {
    return scopeType;
  }
}
