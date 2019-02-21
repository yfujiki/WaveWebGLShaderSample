//Inspired by https://twitter.com/PJaYOfficial/status/1083459961341001728
precision mediump float;
uniform float t; // time
uniform vec2  r; // resolution

float pi = 3.14 / 2.0;

void main(void){
    vec2 p = (gl_FragCoord.xy * 2.0 - r) / min(r.x, r.y);

	vec4 color = vec4(0.0, 0.0, 0.0, 0.0);
	
	float value = sin((t + p.x) * 2.0 * pi);

	if (p.y < value) {
		color = vec4(114.0/255.0, 156.0/255.0, 172.0/255.0, 1.0);
	}
    
    gl_FragColor = color;
}
