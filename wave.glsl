// ToDos : 
//     1. Probably the original is blending only sign waves with different magnitude/speed
//        https://twitter.com/PJaYOfficial/status/1083459961341001728
//     2. How to blend this in the canvas
//
precision mediump float;
uniform float t; // time
uniform vec2  r; // resolution

float pi = 3.14 / 2.0;

vec4 wave(vec4 src, vec2 position, float tt, vec4 color, float posFactors[2], float timeFactors[2], int level) {
	float value = 0.0;
	for(int i=0; i<2; i++) {
		value = value + sin(-tt * timeFactors[i] * 2.0 + position.x * pi * 2.0 * posFactors[i]) * 0.2 + float(level) * 0.25;
	}
	value = value / float(2);
	
	if (position.y < value) {
		return color;
	}
	
	return src;
}

void main(void){
    vec2 p = (gl_FragCoord.xy * 2.0 - r) / min(r.x, r.y);

	vec4 src = vec4(0.0, 0.0, 0.0, 0.0);
	
    float posFactors1[2]; posFactors1[0] = 2.0; posFactors1[1] = 1.2;
    float timeFactors1[2]; timeFactors1[0] = 1.0; timeFactors1[1] = 2.0;
    vec4 dest1 = wave(src, p, t, vec4(1.0, 0.0, 0.0, 1.0), posFactors1, timeFactors1, 2);

    float posFactors2[2]; posFactors2[0] = 1.5; posFactors2[1] = 1.8;
    float timeFactors2[2]; timeFactors2[0] = 0.3; timeFactors2[1] = 1.2;
    vec4 dest2 = wave(dest1, p, t, vec4(0.0, 1.0, 0.0, 1.0), posFactors2, timeFactors2, 1);

    float posFactors3[2]; posFactors3[0] = 1.1; posFactors3[1] = 1.2;
    float timeFactors3[2]; timeFactors3[0] = 1.8; timeFactors3[1] = 0.4;
    vec4 dest3 = wave(dest2, p, t, vec4(0.0, 0.0, 1.0, 1.0), posFactors3, timeFactors3, 0);

    float posFactors4[2]; posFactors4[0] = 0.8; posFactors4[1] = 1.6;
    float timeFactors4[2]; timeFactors4[0] = 1.2; timeFactors4[1] = 0.9;
    vec4 dest4 = wave(dest3, p, t, vec4(0.0, 0.0, 0.0, 0.0), posFactors4, timeFactors4, -2);
    
    gl_FragColor = dest4;
}
