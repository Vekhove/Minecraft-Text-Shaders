// Animations

vec4 bounce(float vertexId, vec4 vertex, float GameTime, float speed) {
	if (vertexId == 0.0 || vertexId == 3.0) vertex.y -= cos(GameTime * (speed * 1000.0)) * 3.0;
	vertex.y -= max(cos(GameTime * (speed * 1000.0)) * 5.0, 0.0);
	
	vertex.z += 1.0;
	return vertex;
}

float flash(float GameTime, float speed) {
	return cos(GameTime * (speed * 1000.0)) * 1.0;
}

vec4 pulse(float vertexId, vec4 vertex, float GameTime, float speed) {
	if (vertexId == 0.0) {
		vertex.y -= max(cos(GameTime * (speed * 1000.0)) * 1, 0.0);
		vertex.x -= max(cos(GameTime * (speed * 1000.0)) * 1.75, 0.0);
	}
	
	if (vertexId == 1.0) {
		vertex.y += max(cos(GameTime * (speed * 1000.0)) * 1, 0.0);
		vertex.x -= max(cos(GameTime * (speed * 1000.0)) * 1.75, 0.0);
	}
	
	if (vertexId == 2.0) {
		vertex.y += max(cos(GameTime * (speed * 1000.0)) * 1, 0.0);
		vertex.x += max(cos(GameTime * (speed * 1000.0)) * 1.75, 0.0);
	}
	
	if (vertexId == 3.0) {
		vertex.y -= max(cos(GameTime * (speed * 1000.0)) * 1, 0.0);
		vertex.x += max(cos(GameTime * (speed * 1000.0)) * 1.75, 0.0);
	}
	
	return vertex;
}

vec4 rubberBand(float vertexId, vec4 vertex, float GameTime, float speed) {
	if (vertexId == 0.0) {
		vertex.y += max(cos(GameTime * (speed * 1000.0)) * 1, 0.0);
		vertex.x -= max(cos(GameTime * (speed * 1000.0)) * 2.25, 0.0);
	}
	
	if (vertexId == 1.0) {
		vertex.y -= max(cos(GameTime * (speed * 1000.0)) * 1, 0.0);
		vertex.x -= max(cos(GameTime * (speed * 1000.0)) * 2.25, 0.0);
	}
	
	if (vertexId == 2.0) {
		vertex.y -= max(cos(GameTime * (speed * 1000.0)) * 1, 0.0);
		vertex.x += max(cos(GameTime * (speed * 1000.0)) * 5, 0.0);
	}
	
	if (vertexId == 3.0) {
		vertex.y += max(cos(GameTime * (speed * 1000.0)) * 1, 0.0);
		vertex.x += max(cos(GameTime * (speed * 1000.0)) * 5, 0.0);
	}
	
	return vertex;
}

vec4 shakeX(float vertexId, vec4 vertex, float GameTime, float speed) {
	vertex.x += sin(GameTime * (speed * 1000.0)) * 5.0;
	return vertex;
}

vec4 shakeY(float vertexId, vec4 vertex, float GameTime, float speed) {
	vertex.y += sin(GameTime * (speed * 1000.0)) * 2.5;
	return vertex;
}

vec4 swing(float vertexId, vec4 vertex, float GameTime, mat4 ModelViewMat, float speed) {
	vec4 worldPosition = ModelViewMat * vertex;

	worldPosition.y += sin(GameTime * (speed * 1000.0)) * (worldPosition.x * 0.1);
	
	vec4 localVertex = inverse(ModelViewMat) * worldPosition;
	
	return localVertex;
}

vec4 circle(float vertexId, vec4 vertex, float GameTime, mat4 ModelViewMat, float speed) {
	vertex.x += cos(GameTime * (speed * 1000.0)) * 5.0;;
	vertex.y += sin(GameTime * (speed * 1000.0)) * 5.0;;
	
	return vertex;
}
