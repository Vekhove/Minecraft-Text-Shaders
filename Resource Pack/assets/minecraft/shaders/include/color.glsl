// Color Utilities

// Generate a Rainbow
vec4 rainbow(float posX, float time, sampler2D sampler, ivec2 uv, float speed) {
	float oscillationFactor = posX + time * speed;
	
	vec4 sineWave = sin(vec4(10.0 * oscillationFactor) + vec4(0, 10, 21, 1));
	
	vec4 scaledSineWave = 0.6 + (0.6 * sineWave);
	
	vec4 withOpaque = scaledSineWave + vec4(0.0, 0.0, 0.0, 1.0);
	
	return withOpaque;
}

// Generate a Gradient
vec4 gradient(float posX, float time, sampler2D sampler, ivec2 uv, float speed, vec4 color1, vec4 color2) {
	float oscillationFactor = posX + time * speed * 0.5;
	
	vec4 sineWave = sin(vec4(10.0 * oscillationFactor));
	
	vec4 scaledSineWave = 0.5 + (sineWave) / 2;
	
	vec4 gradientColor = mix(color1, color2, clamp(scaledSineWave, 0.0, 1.0));
	gradientColor.w = 1.0;
	
	return gradientColor;
}