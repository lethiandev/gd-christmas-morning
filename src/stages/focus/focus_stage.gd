extends Node

export(String, FILE, "*.tscn") var next_level: String

func _ready() -> void:
	if not OS.has_feature("HTML5"):
		_continue()

func _input(p_event: InputEvent) -> void:
	var is_mouse = p_event is InputEventMouseButton
	var is_touch = p_event is InputEventScreenTouch
	if is_mouse or is_touch:
		_continue()

func _continue() -> void:
	get_tree().change_scene(next_level)
