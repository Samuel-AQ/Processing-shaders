/**
 * @author: Samuel Arrocha Quevedo
 * @version: 28/04/2021
 */

PShader shaders;
boolean helpScreen, titleScreen;
float lightIntensity, resolutionConstant;

void setup() {
  size(500, 500, P3D);
  shaders = loadShader("shaders/fragment.glsl", "shaders/vertex.glsl");
  helpScreen = false;
  titleScreen = false;
  lightIntensity = 1.0;
  resolutionConstant = 100.0;
}

void draw() {
  int radius = 100;
  color black = color(0);

  background(black);

  if (titleScreen && helpScreen) {
    showHelpScreen();
  } else if (titleScreen) {
    showTitleScreen();
  } else {
    PImage texture = loadImage("images/texture.jpg");
    PShape sphere = createShape(SPHERE, radius);

    shaders.set("texture", texture);
    shaders.set("lightIntensity", lightIntensity);
    shaders.set("resolutionConstant", resolutionConstant);
    shader(shaders);

    noStroke();
    translate(width / 2, height / 2);
    rotateY(radians(mouseX));
    rotateX(radians(mouseY));
    sphere.setTexture(texture); 
    shape(sphere);
  }
}

void showTitleScreen() {
  color black = color(0);
  PImage titleImage = loadImage("images/title.png");
  String title = "SHADER EXAMPLES\n";
  String info = "Press 'enter' to start\n"
    + "Press 'H' to open help screen";

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

  fill(black);
  textAlign(CENTER);
  textSize(30);
  text(title, width / 2, height * 0.15);
  textSize(20);
  text(controls, width / 2, height * 0.5);
}

// CONTROL METHODS

void keyPressed() {
  if (keyCode == 'h' || keyCode == 'H') helpScreen = !helpScreen;
  if (keyCode == ENTER) titleScreen = false;
  
  // Resolution controls
  if(keyCode == UP){
    if(resolutionConstant + 10.0 <= 100.0) resolutionConstant += 10.0;
  }
  
  if(keyCode == DOWN){
    if(resolutionConstant - 10.0 >= 0.0) resolutionConstant -= 10.0;
  }
  println(resolutionConstant);
}

void mouseWheel(MouseEvent event) {
  float constant = event.getCount() * (-0.05);
  if (constant < 0 && lightIntensity - constant >= 0.0) lightIntensity += constant;
  if (constant > 0 && lightIntensity + constant <= 1.0) lightIntensity += constant;
}
