#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;
varying vec4 diffuse;

void main(){
    vec4 textureColor =  texture2D(texture, gl_TexCoord[0].st);
    gl_FragColor = (gl_LightSource[0].ambient + diffuse) * textureColor;
}