extends Tween

func start_animation(p_target: Sprite) -> void:
	var offset = Vector2(0.0, 2.0)
	interpolate_property(p_target, "position",
		offset, offset * -1, 0.5, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	interpolate_property(p_target, "position",
		offset * -1, offset, 0.5, Tween.TRANS_SINE, Tween.EASE_IN_OUT, 0.5)
	start()
	
	# Randomize animation tick
	seek(randf())
