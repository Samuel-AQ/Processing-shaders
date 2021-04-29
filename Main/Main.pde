/**
 * @author: Samuel Arrocha Quevedo
 * @version: 03/05/2021
 */

PShader shaders;
boolean helpScreen, titleScreen;
float lightIntensity, resolutionConstant;

void setup() {
  size(500, 500, P3D);
  shaders = loadShader("shaders/fragment.glsl", "shaders/vertex.glsl");
  helpScreen = true;
  titleScreen = true;
  lightIntensity = 1.0;
  resolutionConstant = 100.0;
}

void draw() {
  int radius = 100;
  color black = color(0);
  
  if (titleScreen) {
    showTitleScreen();
  } else {
    background(black);
    if(helpScreen) showHelpScreen();
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
  color white = color(255);
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

void showHelpScreen() {
  color white = color(255);
  String controls = "· Move the mouse to rotate the sphere\n"
    + "· Use the mouse wheel to increase or decrease the light\n"
    + "· Press up key to increase resolution\n"
    + "· Press down key to decrease resolution\n"
    + "· Press H to hide or show help";
  
  resetShader();
  pushMatrix();
  fill(white);
  textAlign(LEFT);
  textSize(14);
  text(controls, width * 0.05, height * 0.05);
  popMatrix();
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
}

void mouseWheel(MouseEvent event) {
  float constant = event.getCount() * (-0.05);
  if (constant < 0 && lightIntensity - constant >= 0.0) lightIntensity += constant;
  if (constant > 0 && lightIntensity + constant <= 1.0) lightIntensity += constant;
}
