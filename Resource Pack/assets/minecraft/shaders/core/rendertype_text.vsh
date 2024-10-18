#version 150

#moj_import <fog.glsl>
#moj_import <color.glsl>
#moj_import <animation.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV2;

uniform sampler2D Sampler2;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform float GameTime;

out float vertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;

void main() {
	vec4 vertex = vec4(Position, 1.0);
	float vertexId = mod(gl_VertexID, 4.0);
	
	vec4 rainbowStop = vec4(0, 28, 21, 1);
	vec4 rainbowBrightness = vec4(0.0, 0.0, 0.0, 1.0);
	
	// Initialise default values.
	gl_Position = ProjMat * ModelViewMat * vertex;
	vertexColor = Color * texelFetch(Sampler2, UV2 / 16, 0);
	
	// Rainbow - #FFFFFE
	if (Color.xyz == vec3(255.0, 255.0, 254.0) / 255.0) {
		float speed = 4.0; // EDITABLE
		vertexColor = rainbow(gl_Position.x, GameTime, Sampler2, UV2, speed * 100);
	}
	
	// {COLOR1} to {COLOR2} Gradient - #FFFEFF
	else if (Color.xyz == vec3(255.0, 254.0, 255.0) / 255.0) {
		float speed = 4.0;
		vec4 color1 = vec4(255.0, 255.0, 255.0, 255.0) / 255.0;
		vec4 color2 = vec4(0.0, 0.0, 0.0, 255.0) / 255.0;
		vertexColor = gradient(gl_Position.x, GameTime, Sampler2, UV2, speed * 100.0, color1, color2);
	}
	
	// Bounce - #FEFFFF
	else if (Color.xyz == vec3(254.0, 255.0, 255.0) / 255.0) {
		float speed = 3.0;
		vec4 bounce = bounce(vertexId, vertex, GameTime, speed);
		gl_Position = ProjMat * ModelViewMat * bounce;
	}
	
	vertexDistance = length((ModelViewMat * vertex).xyz);
	texCoord0 = UV0 + vec2(5.0, 1.0);
}