#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

varying vec4 diffuse;

void main(){
  gl_Position = ftransform();
  gl_TexCoord[0] = gl_TextureMatrix[0] * gl_MultiTexCoord0;

  vec3 normal = gl_Normal;
  vec3 lightVector = normalize(gl_LightSource[0].position.xyz);
  float normal_dot_direction = max(0.0, dot(normal, lightVector));
  diffuse = gl_LightSource[0].diffuse * normal_dot_direction;
}