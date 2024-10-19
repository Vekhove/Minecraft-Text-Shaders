#version 150

#moj_import <fog.glsl>
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
	
	// Initialise default values.
	gl_Position = ProjMat * ModelViewMat * vertex;
	vertexColor = Color * texelFetch(Sampler2, UV2 / 16, 0);
	vertexDistance = length((ModelViewMat * vertex).xyz);
	texCoord0 = UV0 + vec2(5.0, 1.0);

	// Each animation with a different amount of frames, size, or speed needs to be a different colour.
	// Each frame needs to be 16x16.
	// #FFFF04
	if (Color.xyz == vec3(255.0, 255.0, 4.0) / 255.0) {
		vertexColor = vec4(1.0, 1.0, 1.0, vertexColor.a);
		texCoord0 = spritesheet(83, 10, 10, 160, 160, UV0, GameTime, 30.0, vertexId);
	}

	// Remove the shadow (depends on the colour used).
	if (Color.xyz == floor(vec3(255.0, 255.0, 4.0) / 4.0) / 255.0) {
		vertexColor = vec4(0.0, 0.0, 0.0, 0.0);
	}

	// A second animation.
	// #FFFF08
	if (Color.xyz == vec3(255.0, 255.0, 8.0) / 255.0) {
		vertexColor = vec4(1.0, 1.0, 1.0, vertexColor.a);
		texCoord0 = spritesheet(51, 8, 8, 128, 128, UV0, GameTime, 12.0, vertexId);
	}

	// Remove the shadow for this animation.
	if (Color.xyz == floor(vec3(255.0, 255.0, 8.0) / 4.0) / 255.0) {
		vertexColor = vec4(0.0, 0.0, 0.0, 0.0);
	}

}
