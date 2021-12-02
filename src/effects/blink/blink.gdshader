shader_type canvas_item;

uniform vec4 blink_color: hint_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform float blink_timer = 0.0;
uniform float blink_frequency = 4.0;

void fragment() {
	COLOR = texture(TEXTURE, UV);
	
	float freq = blink_timer * blink_frequency;
	if (blink_timer > 0.0 && fract(freq) > 0.5) {
		COLOR.rgb = blink_color.rgb;
	}
}
