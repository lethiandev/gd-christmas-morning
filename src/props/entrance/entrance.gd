extends Area2D
tool

export(PackedScene) var next_level

export var locked = false \
	setget set_lock, is_locked

func set_lock(p_locked: bool) -> void:
	$Sprite.frame = 1 if p_locked else 0
	locked = p_locked

func is_locked() -> bool:
	return locked

func interact(p_other: Node) -> void:
	pass
