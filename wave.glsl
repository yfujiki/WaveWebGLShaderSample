//Inspired by https://twitter.com/PJaYOfficial/status/1083459961341001728
precision mediump float;
uniform float t; // time
uniform vec2  r; // resolution

float pi = 3.14 / 2.0;

vec4 colorOfWave(float ttime, vec2 position, vec4 srcColor, vec4 targetColor) {
	float value = sin((ttime + position.x) * 2.0 * pi);

	vec4 color = srcColor;
	if (position.y < value) {
		color = targetColor;
	}
	
	return color;
}

void main(void){
    vec2 p = (gl_FragCoord.xy * 2.0 - r) / min(r.x, r.y);

	vec4 color = vec4(0.0, 0.0, 0.0, 0.0);
	vec4 destColor = colorOfWave(t, p, color, vec4(114.0/255.0, 156.0/255.0, 172.0/255.0, 1.0));
	
    gl_FragColor = destColor;
}
