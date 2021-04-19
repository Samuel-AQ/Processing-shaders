/**
* @author: Samuel Arrocha Quevedo
* @version: 26/04/21
*/

import java.util.Map;

Map<String, PShader> shaders;
String currentMode;

void setup(){
  size(500, 500, P2D);
  
  // Shaders manager
  shaders = new HashMap<String, PShader>();
  shaders.put("Rainbow", loadShader("shaders/rainbow.glsl"));
  
  currentMode = "Rainbow";
}

void draw(){
  color black = color(0);
  background(black);
  loadShade();
}

void loadShade(){
  PShader currentShader = shaders.get(currentMode);
  currentShader.set("u_resolution", float(width), float(height));
  currentShader.set("u_time", millis() / 1000.0);
  rect(0, 0, width, height);
  shader(currentShader);
}
