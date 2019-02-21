//Inspired by https://twitter.com/PJaYOfficial/status/1083459961341001728
precision mediump float;
uniform float t; // time
uniform vec2  r; // resolution

float pi = 3.14 / 2.0;

vec4 colorOfWave(float ttime, vec2 position, vec4 srcColor, vec4 targetColor, float timeFactor, float offsetX, float offsetY) {
	float value = sin((ttime * timeFactor + (position.x + offsetX)) * 2.0 * pi) * 0.1 + offsetY;

	vec4 color = srcColor;
	if (position.y < value) {
		color = targetColor;
	}
	
	return color;
}

void main(void){
    vec2 p = (gl_FragCoord.xy * 2.0 - r) / min(r.x, r.y);

	vec4 color = vec4(0.0, 0.0, 0.0, 0.0);
	vec4 color1 = colorOfWave(t, p, color, vec4(114.0/255.0, 156.0/255.0, 172.0/255.0, 1.0), 1.0, 0.0, 0.8);
	vec4 color2 = colorOfWave(t, p, color1, vec4(66.0/255.0, 77.0/255.0, 83.0/255.0, 1.0), 1.2, 0.4, 0.4);
	vec4 color3 = colorOfWave(t, p, color2, vec4(1.0/255.0, 0.0, 1.0/255.0, 1.0), 1.4, 0.8, 0.0);
	vec4 color4 = colorOfWave(t, p, color3, vec4(0.0, 0.0, 0.0, 0.0), 1.2, 0.4, -0.4);
	
    gl_FragColor = color4;
}
