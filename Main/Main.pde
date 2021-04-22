/**
 * @author: Samuel Arrocha Quevedo
 * @version: 26/04/21
 */

import java.util.Map;

Map<String, PShader> shaders;
String currentMode;
boolean titleScreen, helpScreen;

void setup() {
  size(500, 500, P2D);

  // Shaders manager
  shaders = new HashMap<String, PShader>();
  shaders.put("Rainbow", loadShader("shaders/rainbow.glsl"));
  shaders.put("Hourglass", loadShader("shaders/hourglass.glsl"));

  currentMode = "Rainbow";
  titleScreen = true;
  helpScreen = false;
}

void draw() {
  color black = color(0);
  background(black);
  if (helpScreen && titleScreen) {
    showHelpScreen();
  } else if (titleScreen) {
    showTitleScreen();
  } else {
    loadShade();
  }
}

void showTitleScreen() {
  color black = color(0);
  PImage titleImage = loadImage("images/title.png");
  String title = "SHADER EXAMPLES\n";
  String info = "Press 'enter' to start\n"
    + "Press 'H' to open help screen";

  whiteBackground();
  image(titleImage, width * 0.3, height * 0.25, 200, 200);
  textAlign(CENTER);
  fill(black);
  textSize(30);
  text(title, width / 2, height * 0.15);
  textSize(20);
  text(info, width / 2, height * 0.8);
}

void showHelpScreen() {
  color black = color(0);
  String title = "HELP\n";
  String controls = "Press 1 to run rainbow shader\n"
    + "Press 2 to run hourglass shader\n"
    + "Press 'H' to show or hide the help screen";

  whiteBackground();
  fill(black);
  textAlign(CENTER);
  textSize(30);
  text(title, width / 2, height * 0.15);
  textSize(20);
  text(controls, width / 2, height * 0.5);
}

void loadShade() {
  PShader currentShader = shaders.get(currentMode);
  currentShader.set("u_resolution", float(width), float(height));
  currentShader.set("u_time", millis() / 1000.0);
  rect(0, 0, width, height);
  shader(currentShader);
}

void whiteBackground() {
  color white = color(255);
  background(white);
}

void keyPressed() {
  if (keyCode == '1') currentMode = "Rainbow";
  if (keyCode == '2') currentMode = "Hourglass";
  if (keyCode == 'h' || keyCode == 'H') helpScreen = !helpScreen;
  if (keyCode == ENTER) titleScreen = false;
}
