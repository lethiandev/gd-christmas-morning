shader_type canvas_item;
render_mode blend_mix;

uniform int particles_anim_h_frames;
uniform int particles_anim_v_frames;
uniform bool particles_anim_loop;

void vertex() {
	float h_frames = float(particles_anim_h_frames);
	float v_frames = float(particles_anim_v_frames);
	
	VERTEX.xy /= vec2(h_frames, v_frames);
	
	float particle_total_frames = float(particles_anim_h_frames * particles_anim_v_frames);
	float particle_frame = floor(INSTANCE_CUSTOM.z * h_frames);
	float particle_variant = floor(COLOR.r * v_frames);
	particle_variant = clamp(particle_variant, 0.0, v_frames - 1.0);
	if (!particles_anim_loop) {
		particle_frame = clamp(particle_frame, 0.0, h_frames - 1.0);
	} else {
		particle_frame = mod(particle_frame, v_frames);
	}
	
	UV /= vec2(h_frames, v_frames);
	UV += vec2(particle_frame / h_frames, particle_variant / v_frames);
}

void fragment() {
	float alpha = COLOR.a;
	COLOR = texture(TEXTURE, UV);
	COLOR.a *= alpha;
}
