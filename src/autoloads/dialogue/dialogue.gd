extends CanvasLayer

var lines = []
onready var message_node = $ViewportContainer/Viewport/HBoxContainer/NinePatchRect/Message

func dialog_start(p_dialog: Array) -> void:
	lines = p_dialog.duplicate()
	_dialog_begin()

func _dialog_begin() -> void:
	get_tree().set_pause(true)
	message_node._set_text("")
	$AnimationPlayer.play("slide_in")
	yield($AnimationPlayer, "animation_finished")
	_dialog_continue()

func _dialog_continue() -> void:
	var line = lines.pop_front()
	message_node.tween_text(line.what)
	yield(message_node, "text_completed")
	if not lines.empty():
		_dialog_continue()
	else:
		_dialog_end()

func _dialog_end() -> void:
	$AnimationPlayer.play("slide_out")
	yield($AnimationPlayer, "animation_finished")
	get_tree().set_pause(false)
