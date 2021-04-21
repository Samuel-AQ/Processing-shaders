#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

void check_time(float start_time, float finish_time, float y_origin, float y_end, float current_y){
    vec3 white = vec3(1.0);
    vec3 sand = vec3(1.000,0.669,0.360);

    if(sin(u_time) >= start_time && sin(u_time) < finish_time && current_y <= y_origin && current_y >= y_end){
            gl_FragColor = vec4(sand, 1.0);
    } else {
            gl_FragColor = vec4(white, 1.0);
    }
}

void main() {
    vec2 st = gl_FragCoord.xy/u_resolution.xy;
    //st.x *= u_resolution.x/u_resolution.y;
    float right_limit = 500.0, y_pointer = 0.0;
    const float increment = 0.5;
    vec3 white = vec3(1.0);

    // Lower triangle
    for(float left_limit = 0.0; left_limit < 250.0; left_limit += increment){
        if(gl_FragCoord.x > left_limit && gl_FragCoord.x < right_limit && gl_FragCoord.y < y_pointer){
            gl_FragColor = vec4(white, 1.0);
    	} 
        right_limit -= increment;
        y_pointer += increment;
    }
    
    // Upper triangle
    for(float left_limit = 250.0; left_limit > 0.0; left_limit -= increment){
        if(gl_FragCoord.x > left_limit && gl_FragCoord.x < right_limit && gl_FragCoord.y > y_pointer){
            check_time(0.0, 0.2, 1.0, 0.5, st.y);
            check_time(0.2, 0.4, 0.8, 0.5, st.y);
            check_time(0.4, 0.6, 0.6, 0.5, st.y);
    	} 
        right_limit += increment;
        y_pointer += increment;
    }
}