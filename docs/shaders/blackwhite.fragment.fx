#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {
    // Color
    vec4 color_in = texture(image, model_uv);
    float l =  0.299 * color_in.r + 0.587 * color_in.g + 0.114 * color_in.b;
    FragColor = vec4(l,l,l,1);
}
