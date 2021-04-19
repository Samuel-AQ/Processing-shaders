#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main() {
    // Manages the canvas
    vec2 st = gl_FragCoord.xy/u_resolution.xy;
    
    // Defines the color of the bar
	vec3 color;
    if(st.y > 0.86) color = vec3(1.0 - abs(sin(u_time)), 0.0, 0.0);
    if(st.y < 0.86 && st.y > 0.72) color = vec3(1.0 - abs(sin(u_time)), 0.8 - abs(sin(u_time)), 0.0);
    if(st.y < 0.72 && st.y > 0.58) color = vec3(1.0 - abs(sin(u_time)), 1.0 - abs(sin(u_time)), 0.0);
    if(st.y < 0.58 && st.y > 0.44) color = vec3(0.0, 1.0 - abs(sin(u_time)), 0.0);
    if(st.y < 0.44 && st.y > 0.30) color = vec3(0.0, 0.7 - abs(sin(u_time)), 1.0 - abs(sin(u_time)));
	if(st.y < 0.30 && st.y > 0.16) color = vec3(0.0, 0.0, 1.0 - abs(sin(u_time)));
    if(st.y < 0.16 && st.y > 0.0) color = vec3(0.6 - abs(sin(u_time)), 0.0, 1.0 - abs(sin(u_time)));
    
    // Applies the correct color in the area
    gl_FragColor = vec4(color, 1.0);
}