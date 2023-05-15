#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Constants
const float dotSize = 0.001;      // Size of each dot
const float dotDensity = .4;    // Density of dots

// Output
out vec4 FragColor;

void main() {
    // Sample the original image
    vec4 color = texture(image, model_uv);

    // float l =  0.299 * color.r + 0.587 * color.g + 0.114 * color.b;
    // vec4 grayscale = vec4(l,l,l,1);

    // Calculate the dot grid position
    vec2 dotPosition = (floor(model_uv / dotSize) + 0.5) * dotSize;

    // Calculate the distance between the fragment and the dot center
    float distanceToDot = distance(model_uv, dotPosition);

    // Calculate the dot intensity based on dot density
    float scaledDotDensity = dotDensity * 5.0;  // Scale dotDensity to range from 0 to 1.0
    float dotIntensity = 1.0 - min(distanceToDot / (dotSize * scaledDotDensity), 1.0);

    // Apply the dot intensity to the color
    FragColor = vec4(dotIntensity) * color;
}
