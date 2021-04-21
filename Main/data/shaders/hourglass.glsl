#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

void main() {
    vec2 st = gl_FragCoord.xy/u_resolution.xy;
    //st.x *= u_resolution.x/u_resolution.y;
    vec3 white = vec3(1.0);
    float right_limit = 500.0, y_pointer = 0.0;
    const float increment = 0.5;
    
    for(float left_limit = 0.0; left_limit < 250.0; left_limit += increment){
        if(gl_FragCoord.x > left_limit && gl_FragCoord.x < right_limit && gl_FragCoord.y < y_pointer){
        	gl_FragColor = vec4(white, 1.0);
            
    	} 
        right_limit -= increment;
        y_pointer += increment;
    }
    
    for(float left_limit = 250.0; left_limit > 0.0; left_limit -= increment){
        if(gl_FragCoord.x > left_limit && gl_FragCoord.x < right_limit && gl_FragCoord.y > y_pointer){
        	gl_FragColor = vec4(white, 1.0);
    	} 
        right_limit += increment;
        y_pointer += increment;
    }
}