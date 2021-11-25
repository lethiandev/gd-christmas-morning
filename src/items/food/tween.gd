extends Tween

func start_animation(p_target: Node) -> void:
	var from = Vector2(0.0, -2.0)
	var to = Vector2(0.0, 2.0)
	
	remove_all()
	interpolate_property(p_target, "position", from, to, 0.5, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	interpolate_property(p_target, "position", to, from, 0.5, Tween.TRANS_SINE, Tween.EASE_IN_OUT, 0.5)
	start()
	
	# Randomize animation tick
	seek(randf())
