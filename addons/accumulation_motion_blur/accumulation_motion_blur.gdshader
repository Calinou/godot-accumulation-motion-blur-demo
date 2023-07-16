shader_type canvas_item;

uniform float strength : hint_range(0.0, 1.0, 0.0001) = 0.6667;
uniform sampler2D screen_tex : hint_screen_texture, filter_nearest;

const float EPSILON = 1.0 / 255.0;

void fragment() {
	vec4 previous_frame = COLOR;
	vec4 current_frame = texture(screen_tex, SCREEN_UV);

	vec4 delta_color = (1.0-strength)*(current_frame - previous_frame);

	// Prevent values getting stuck in a loop due to floating-point precision errors and truncation.
	delta_color = sign(delta_color)*max(abs(delta_color), EPSILON);

	COLOR = previous_frame + delta_color;
}
