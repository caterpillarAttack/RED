/***********************************
 * exoPostBaseV.glsl
 * Provides screen coordinates for post processing effects.
 * This is basically a more minimal reimplementation of postDeferredV.glsl.
 * Copyright Geenz Spad, 2012
 ***********************************/
uniform mat4 modelview_projection_matrix;

layout (location = 0) in vec3 position;
layout (location = 2) in vec2 texcoord0;

out vec2 vary_fragcoord;

uniform vec2 screen_res;

void main() 
{
	vec4 pos = modelview_projection_matrix * vec4(position.xyz, 1.0);
	gl_Position = pos;
        
	vary_fragcoord.xy = (pos.xy * 0.5 + 0.5) * screen_res;
}
