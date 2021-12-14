extends Area2D
tool

signal switch_enabled()
signal switch_disabled()

export var enabled = false \
	setget set_enable, is_enabled

func set_enable(p_enabled: bool) -> void:
	$Sprite.frame = 1 if p_enabled else 0
	enabled = p_enabled

func is_enabled() -> bool:
	return enabled

func interact_enter(p_other: Node) -> void:
	$ButtonAction.show()

func interact_leave(p_other: Node) -> void:
	$ButtonAction.hide()

func interact(p_other: Node) -> void:
	set_enable(not is_enabled())
	emit_signal("switch_enabled" if enabled else "switch_disabled")
	$SwitchPlayer.play()
