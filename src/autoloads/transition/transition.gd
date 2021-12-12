extends CanvasLayer

func fade_in() -> void:
	get_tree().set_pause(false)
	_tween_alpha_channel(0.0)

func fade_out(p_next: PackedScene = null) -> void:
	get_tree().set_pause(true)
	_tween_alpha_channel(1.0)
	yield($Tween, "tween_completed")
	_change_scene(p_next)

func _tween_alpha_channel(p_alpha) -> void:
	var modulate = $ColorRect.modulate
	var final = Color(modulate.r, modulate.g, modulate.b, p_alpha)
	$Tween.remove_all()
	$Tween.interpolate_property($ColorRect, "modulate", modulate, final, 0.25)
	$Tween.start()

func _change_scene(p_scene: PackedScene) -> void:
	if p_scene != null:
		get_tree().change_scene_to(p_scene)
