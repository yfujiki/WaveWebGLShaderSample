//Inspired by https://twitter.com/PJaYOfficial/status/1083459961341001728

float pi = 3.14 / 2.0;

vec4 colorOfWave(float ttime, vec2 position, vec4 srcColor, vec4 targetColor, float timeFactor, float offsetX, float offsetY) {
	float value = sin((ttime * timeFactor + (position.x + offsetX)) * 2.0 * pi) * 0.1 + offsetY;
	value += sin(position.x * 4.0 * pi) * 0.01;

	vec4 color = srcColor;
	if (position.y < value) {
		color = targetColor;
	}
	
	return color;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord ){
    vec2 p = (fragCoord.xy * 2.0 - iResolution.xy) / min(iResolution.x, iResolution.y);

	vec4 color = vec4(1.0, 1.0, 1.0, 1.0);
	vec4 color1 = colorOfWave(iTime, p, color, vec4(114.0/255.0, 156.0/255.0, 172.0/255.0, 1.0), 1.0, 0.0, 0.8);
	vec4 color2 = colorOfWave(iTime, p, color1, vec4(66.0/255.0, 77.0/255.0, 83.0/255.0, 1.0), 1.2, 0.4, 0.4);
	vec4 color3 = colorOfWave(iTime, p, color2, vec4(1.0/255.0, 0.0, 1.0/255.0, 1.0), 1.4, 0.8, 0.0);
	vec4 color4 = colorOfWave(iTime, p, color3, vec4(1.0, 1.0, 1.0, 1.0), 1.2, 0.4, -0.4);
	
    fragColor = color4;
}

