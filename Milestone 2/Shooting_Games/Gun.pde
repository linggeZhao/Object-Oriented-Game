class Gun {
  String type;
  String scopeType;

  Gun(String type, String scopeType) {
    this.type = type;
    this.scopeType = scopeType;
  }

  void display() {
    fill(0);
    rectMode(CENTER);
    rect(mouseX, height - 10, 10, 40);
    rect(mouseX, height - 30, 20, 10);

    stroke(0);
    line(mouseX - 10, mouseY, mouseX + 10, mouseY);
    line(mouseX, mouseY - 10, mouseX, mouseY + 10);
  }

  String getType() {
    return type;
  }

  String getScopeType() {
    return scopeType;
  }
}
