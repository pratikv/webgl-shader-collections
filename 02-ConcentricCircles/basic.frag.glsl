precision mediump float;

const float PI = 3.141592;

uniform vec2 uResolution;
uniform float uTime;

/* Not required for this shader */
varying vec2 vUV;

void main(void){
    /* Get the maximum of the width and height */
    float mx = max(uResolution.x, uResolution.y);
    /* 
        Get the UV based on the max. 
        This uv is for the present pixel.
        In case of max side it will be 1.0, where as for the other side it will be less than 1 */
    vec2 uv = gl_FragCoord.xy / mx;
    float t = uTime / 100.0;

    /* 
        Get the canter of the screen based on resolution.
        Can be input as a uniform.
        Multiplying with half to get the center of the screen.
     */
    vec2 center = uResolution/mx * 0.5;

    /*
        The center is in the range of 0 to 1 as the manipulations are done based on UVs.
        Multiplying by 255 to get the maximum of the color. 
        It also acts as the distance between two concentric circles.
     */
    float vs = sin(t - distance(uv, center) * 255.0);
    gl_FragColor = vec4(vec3(vs*0.3), 1.0);
}
