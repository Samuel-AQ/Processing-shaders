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

  currentMode = "Hourglass";
  titleScreen = true;
  helpScreen = false;
}

void draw() {
  color black = color(0);
  background(black);
  if (titleScreen) {
    showTitleScreen();
  } else if (helpScreen) {
    showHelpScreen();
  } else {
    loadShade();
  }
}

void showTitleScreen(){
  color white = color(255);
  color black = color(0);
  PImage titleImage = loadImage("images/title.png");
  String title = "SHADER EXAMPLES\n";
  String info = "Press 'enter' to start";
  
  background(white);
  image(titleImage, width * 0.3, height * 0.25, 200, 200);
  textAlign(CENTER);
  fill(black);
  textSize(30);
  text(title, width / 2, height * 0.15);
  textSize(20);
  text(info, width / 2, height * 0.8);
}

void showHelpScreen(){

}

void loadShade() {
  PShader currentShader = shaders.get(currentMode);
  currentShader.set("u_resolution", float(width), float(height));
  currentShader.set("u_time", millis() / 1000.0);
  rect(0, 0, width, height);
  shader(currentShader);
  println(abs(sin(millis() /1000.0)));
}

void keyPressed() {
  if (keyCode == '1') currentMode = "Rainbow";
  if (keyCode == '2') currentMode = "Hourglass";
}
