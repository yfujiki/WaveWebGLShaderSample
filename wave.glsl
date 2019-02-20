// ToDos : 
//     1. Probably the original is blending only sign waves with different magnitude/speed
//        https://twitter.com/PJaYOfficial/status/1083459961341001728
//     2. How to blend this in the canvas
//
precision mediump float;
uniform float t; // time
uniform vec2  r; // resolution

float pi = 3.14 / 2.0;

vec4 wave(vec4 src, vec2 position, float tt, vec4 color, float timeFactor, float offsetFactor, float level) {
	float value = sin(-tt * timeFactor * 2.0 + (position.x + offsetFactor) * 2.0 * pi) * 0.2 + level * 0.25;
	
	if (position.y < value) {
		return color;
	}
	
	return src;
}

void main(void){
    vec2 p = (gl_FragCoord.xy * 2.0 - r) / min(r.x, r.y);

	vec4 src = vec4(0.0, 0.0, 0.0, 0.0);
	
    vec4 dest1 = wave(src, p, t, vec4(114.0/255.0, 156.0/255.0, 172.0/255.0, 1.0), 1.0, 0.0, 2.0);
    vec4 dest2 = wave(dest1, p, t, vec4(66.0/255.0, 77.0/255.0, 83.0/255.0, 1.0), 1.2, 0.2, 1.0);
    vec4 dest3 = wave(dest2, p, t, vec4(1.0/255.0, 0.0, 1.0/255.0, 1.0), 1.4, 0.4, 0.0);
    vec4 dest4 = wave(dest3, p, t, vec4(0.0, 0.0, 0.0, 0.0), 1.2, 0.6, -2.0);
    
    gl_FragColor = dest4;
}
