#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

bool check_time(float start_time, float finish_time, float y_origin, float y_end, float current_y){
    vec3 white = vec3(1.0);
    vec3 sand = vec3(1.000,0.669,0.360);

    if(abs(sin(u_time)) <= start_time && abs(sin(u_time)) > finish_time && current_y <= y_origin && current_y >= y_end){
            gl_FragColor = vec4(sand, 1.0);
            return true;
    } else {
            gl_FragColor = vec4(white, 1.0);
            return false;
    }
}

void main() {
    vec2 st = gl_FragCoord.xy/u_resolution.xy;
    float right_limit = 500.0, y_pointer = 0.0;
    const float increment = 0.5;
    vec3 white = vec3(1.0);

    // Lower triangle
    for(float left_limit = 0.0; left_limit < 250.0; left_limit += increment){
        right_limit -= increment;
        y_pointer += increment;
        if(gl_FragCoord.x > left_limit && gl_FragCoord.x < right_limit && gl_FragCoord.y < y_pointer){
            if(check_time(0.9, 0.8, 0.1, 0.0, st.y)) continue;
            if(check_time(0.8, 0.7, 0.2, 0.0, st.y)) continue;
            if(check_time(0.7, 0.6, 0.3, 0.0, st.y)) continue;
            if(check_time(0.6, 0.5, 0.4, 0.0, st.y)) continue;
            if(check_time(0.5, 0.0, 0.5, 0.0, st.y)) continue;
        }
    }
    
    // Upper triangle
    for(float left_limit = 250.0; left_limit > 0.0; left_limit -= increment){
        right_limit += increment;
        y_pointer += increment;
        if(gl_FragCoord.x > left_limit && gl_FragCoord.x < right_limit && gl_FragCoord.y > y_pointer){
            if(check_time(1.0, 0.9, 1.0, 0.5, st.y)) continue;
            if(check_time(0.9, 0.8, 0.9, 0.5, st.y)) continue;
            if(check_time(0.8, 0.7, 0.8, 0.5, st.y)) continue;
            if(check_time(0.7, 0.6, 0.7, 0.5, st.y)) continue;
            if(check_time(0.6, 0.5, 0.6, 0.5, st.y)) continue;
    	} 
    }
}