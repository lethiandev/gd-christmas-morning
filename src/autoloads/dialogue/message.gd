extends Label

signal text_completed()

var duration = 0.0

func _physics_process(p_delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		_continue_pressed()

func _continue_pressed() -> void:
	if $Tween.is_active():
		$Tween.seek(duration - 0.001)
		return
	emit_signal("text_completed")
	_set_continue_visible(false)

func tween_text(p_text: String) -> void:
	_set_text(p_text)
	$Tween.remove_all()
	$Tween.interpolate_property(self, "percent_visible", 0.0, 1.0, duration)
	$Tween.interpolate_callback(self, duration, "_set_continue_visible", true)
	$Tween.start()

func _set_text(p_text: String) -> void:
	duration = p_text.length() * 0.05
	set_text(p_text)
	set_percent_visible(0.0)
	_set_continue_visible(false)

func _set_continue_visible(p_visible: bool) -> void:
	get_node("../Continue").set_visible(p_visible)
