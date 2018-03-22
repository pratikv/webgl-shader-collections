precision mediump float;

const float PI = 3.141592;

uniform vec2 uResolution;
uniform float uTime;

/* Not required for this shader */
varying vec2 vUV;

void main(void){
    /* Get the uv coordinate at the pixel */
    vec2 st = gl_FragCoord.xy / uResolution.xy;

    /* Initialize it to 0 */
    vec3 color = vec3(0.0);

    /*  */
    vec2 borders = smoothstep(vec2(0.0), vec2(0.1), st);
    float pct = borders.x * borders.y;

    vec2 tr = smoothstep(vec2(0.0), vec2(0.1), 1.0 - st);
    pct *= tr.x * tr.y;

    color = vec3(pct);


    gl_FragColor = vec4(color, 1.0);
}
