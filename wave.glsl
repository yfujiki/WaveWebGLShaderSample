precision mediump float;
uniform float t; // time
uniform vec2  r; // resolution

float pi = 3.14 / 2.0;

vec3 wave(vec2 position, float tt, vec3 color, float posFactors[2], float timeFactors[2]) {
	float value = 0.0;
	for(int i=0; i<2; i++) {
		value = value + sin(-tt * timeFactors[i] + position.x * pi * posFactors[i]);
	}
	value = value / float(2);
	
	if (position.y < value) {
		return 1.0 * color;
	}
	
	return vec3(1.0, 1.0, 1.0);
}

void main(void){
    vec2 p = (gl_FragCoord.xy * 2.0 - r) / min(r.x, r.y);

    float posFactors1[2]; posFactors1[0] = 2.0; posFactors1[1] = 1.2;
    float timeFactors1[2]; timeFactors1[0] = 1.0; timeFactors1[1] = 2.0;
    vec3 dest1 = wave(p, t, vec3(1.0, 0.0, 0.0), posFactors1, timeFactors1);

    float posFactors2[2]; posFactors2[0] = 1.5; posFactors2[1] = 1.8;
    float timeFactors2[2]; timeFactors2[0] = 0.3; timeFactors2[1] = 1.2;
    vec3 dest2 = wave(p, t, vec3(0.0, 1.0, 0.0), posFactors2, timeFactors2);

    float posFactors3[2]; posFactors3[0] = 1.1; posFactors3[1] = 1.2;
    float timeFactors3[2]; timeFactors3[0] = 1.8; timeFactors3[1] = 0.4;
    vec3 dest3 = wave(p, t, vec3(0.0, 0.0, 1.0), posFactors3, timeFactors3);

    float posFactors4[2]; posFactors4[0] = 0.8; posFactors4[1] = 1.6;
    float timeFactors4[2]; timeFactors4[0] = 1.2; timeFactors4[1] = 0.9;
    vec3 dest4 = wave(p, t, vec3(1.0, 1.0, 1.0), posFactors4, timeFactors4);
    
    gl_FragColor = vec4((dest1 + dest2 + dest3 + dest4) / 4.0, 1.0);
}
