precision mediump float;
uniform float t; // time
uniform vec2  r; // resolution

float pi = 3.14 / 2.0;

vec3 wave(vec2 position, float tt, vec3 color, float posFactors[2], float timeFactors[2]) {
	float value = 0.0;
	for(int i=0; i<2; i++) {
		value = value + sin(tt * timeFactors[i] + position.x * pi * posFactors[i]);
	}
	value = value / float(2);
	
	if (position.y < value) {
		return 1.0 * color;
	}
	
	return vec3(0.0, 0.0, 0.0);
}

void main(void){
    vec2 p = (gl_FragCoord.xy * 2.0 - r) / min(r.x, r.y);

    float posFactors1[2]; posFactors1[0] = 2.0; posFactors1[1] = 1.2;
    float timeFactors1[2]; timeFactors1[0] = 1.0; timeFactors1[1] = 2.0;
    vec3 dest = wave(p, t, vec3(0.3, 0.5, 0.8), posFactors1, timeFactors1);
    
    gl_FragColor = vec4(dest, 1.0);
}
