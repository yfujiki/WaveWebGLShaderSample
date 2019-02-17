precision mediump float;
uniform float t; // time
uniform vec2  r; // resolution

void main(void){
    vec2 p = (gl_FragCoord.xy * 2.0 - r) / min(r.x, r.y);
    vec3 destColor = vec3(1.0, 0.3, 0.7);
    float f = 0.0;
    float pi = 3.14 / 2.0;
    if(p.y < (sin(t + p.x * pi * 2.0) + sin( 2.0 * t + p.x * pi * 1.2)) / 2.0){ 
     	f = 1.0; 
    }
    gl_FragColor = vec4(vec3(destColor * f), 1.0);
}