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
    vec2 new_uv = 2.0 * model_uv - 1.0;
    float theta = atan(new_uv.y, new_uv.x);
    float r = pow(length(new_uv),1.5);
    vec2 fisheye = r * vec2(cos(theta), sin(theta));
    vec2 scaled = 0.5 * (fisheye + 1.0);
    FragColor = texture(image, scaled);
}
