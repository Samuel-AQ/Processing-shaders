#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;
uniform float resolutionConstant;

varying vec4 vertColor;
varying vec4 vertTexCoord;

void main() {
  int si = int(vertTexCoord.s * resolutionConstant);
  int sj = int(vertTexCoord.t * resolutionConstant);
  vec2 textureModifier = vec2(float(si) / resolutionConstant, float(sj) / resolutionConstant);
  gl_FragColor = texture2D(texture, textureModifier) * vertColor;
}