shader_type canvas_item;

uniform bool enabled = false;

void fragment() {
	vec4 base_color = texture(TEXTURE, UV);
	if (enabled) {
		COLOR = mix(base_color, vec4(1.0, 0.0, 0.0, 1), base_color);
	} else {
		COLOR = base_color;
	}
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
