extends Area2D
tool

signal switch_enabled()
signal switch_disabled()
signal switch_toggled()

export var enabled = false \
	setget set_enable, is_enabled

func set_enable(p_enabled: bool) -> void:
	$Sprite.frame = 1 if p_enabled else 0
	enabled = p_enabled

func is_enabled() -> bool:
	return enabled

func toggle(p_fire_events = true) -> void:
	set_enable(not is_enabled())
	if p_fire_events:
		emit_signal("switch_enabled" if enabled else "switch_disabled")
		emit_signal("switch_toggled")

func interact_enter(p_other: Node) -> void:
	$ButtonAction.show()

func interact_leave(p_other: Node) -> void:
	$ButtonAction.hide()

func interact(p_other: Node) -> void:
	toggle()
	$SwitchPlayer.play()
