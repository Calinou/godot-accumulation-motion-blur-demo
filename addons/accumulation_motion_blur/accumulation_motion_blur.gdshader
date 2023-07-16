shader_type canvas_item;

uniform float strength : hint_range(0.0, 1.0, 0.0001) = 0.96;

const float EPSILON = 1.0 / 255.0;

void fragment() {
	// Prevent values getting stuck in a loop due to floating-point precision errors and truncation.
	COLOR.rgb -= max(COLOR.rgb * (1.0 - strength), EPSILON);
}
