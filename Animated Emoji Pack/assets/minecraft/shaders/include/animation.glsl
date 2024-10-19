// Animations

vec2 spritesheet(int frames, int rows, int columns, int width, int height, vec2 UV, float GameTime, float speed, float vertex) {

	int frame = int(mod(GameTime * 20 * 60 * speed, frames));
	int x = frame % columns;
	int y = frame / columns;

	float spriteWidth = width / columns;
	float spriteHeight = height / rows;
	float widthRatio = 1 / spriteWidth;
	float heightRatio = 1 / spriteHeight;

	vec2 texCoord0 = vec2(UV.x + (widthRatio * x), UV.y + (heightRatio * y));

	if (vertex == 1 || vertex == 2) {
		texCoord0.y -= heightRatio * (rows - 1);
	}

	if (vertex == 3 || vertex == 2) {
		texCoord0.x -= widthRatio * (columns - 1);
	}

	return texCoord0;
}