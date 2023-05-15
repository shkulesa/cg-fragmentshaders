#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;
uniform float time;

// Output
out vec4 FragColor;

void main() {
    // Color
    vec2 new_uv = model_uv * 2.0 - 1.0;
    float r = length(new_uv);
    vec2 offset = new_uv * (sin(r * 30.0 - time * 5.0) + 0.5) / 60.0;
    vec2 final_coord = model_uv + offset;
    vec4 final_color = texture(image, final_coord);
    FragColor = final_color;
}
