extends CanvasLayer

func change_scene(p_next: PackedScene) -> void:
	yield(fade_out(), "completed")
	_change_scene(p_next)
	fade_in()

func fade_in() -> GDScriptFunctionState:
	return _tween_fade(false, 0.0)

func fade_out() -> GDScriptFunctionState:
	return _tween_fade(true, 1.0)

func _tween_fade(p_paused: bool, p_alpha: float) -> void:
	get_tree().set_pause(p_paused)
	_tween_alpha_channel(p_alpha)
	return yield($Tween, "tween_completed")

func _tween_alpha_channel(p_alpha) -> void:
	var modulate = $ColorRect.modulate
	var final = Color(modulate.r, modulate.g, modulate.b, p_alpha)
	$Tween.remove_all()
	$Tween.interpolate_property($ColorRect, "modulate", modulate, final, 0.15)
	$Tween.start()

func _change_scene(p_scene: PackedScene) -> void:
	if p_scene != null:
		get_tree().change_scene_to(p_scene)
