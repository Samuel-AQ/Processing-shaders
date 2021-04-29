#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif
/*
varying vec4 diffuse;

void main(){
  gl_Position = ftransform();
  gl_TexCoord[0] = gl_TextureMatrix[0] * gl_MultiTexCoord0;

  //vec3 normal = gl_Normal;
  vec3 normal = gl_NormalMatrix * gl_Normal;
  vec3 lightVector = normalize(gl_LightSource[0].position.xyz);
  float normal_dot_direction = max(0.0, dot(normal, lightVector));
  diffuse = gl_LightSource[0].diffuse * normal_dot_direction;
}*/

uniform mat4 modelview;
uniform mat4 transform;
uniform mat3 normalMatrix;
uniform mat4 texMatrix;

uniform vec4 lightPosition;
uniform float lightIntensity;

attribute vec4 position;
attribute vec4 color;
attribute vec3 normal;
attribute vec2 texCoord;

varying vec4 vertColor;
varying vec4 vertTexCoord;

void main() {
  gl_Position = transform * position;
  vec3 ecPosition = vec3(modelview * position);
  vec3 ecNormal = normalize(normalMatrix * normal);

  vec3 direction = normalize(lightPosition.xyz - ecPosition);
  float intensity = max(0.0, dot(direction, ecNormal));
  vertColor = vec4(intensity, intensity, intensity, lightIntensity) * color;

  vertTexCoord = texMatrix * vec4(texCoord, 1.0, 1.0);
}