/**
* @author: Samuel Arrocha Quevedo
* @version: 28/04/2021
*/

PShader shaders;
boolean helpScreen, titleScreen;

void setup(){
  size(500, 500, P3D);
  shaders = loadShader("shaders/fragment.glsl", "shaders/vertex.glsl");
  helpScreen = false;
  titleScreen = false;
}

void draw(){
  int boxSize = 200;
  color black = color(0);
  
  background(black);
  
  if(titleScreen){
    showTitleScreen();
  } else if(helpScreen){
    showHelpScreen();
  } else {
    shaders.set("u_resolution", (float) width, (float) height);
    shaders.set("u_time", millis() / 1000.0);
    shader(shaders);
    
    translate(width / 2, height / 2);
    rotateY(radians(mouseX));
    rotateX(radians(mouseY));
    box(boxSize);
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

void keyPressed(){
  if (keyCode == 'h' || keyCode == 'H') helpScreen = !helpScreen;
  if (keyCode == ENTER) titleScreen = false;
}
