extends Node2D

export(Array, NodePath) var switches = []

func _ready() -> void:
	for switch_node in get_switch_nodes():
		switch_node.connect("switch_toggled", self, "_on_switch_toggled")
	_check_switches()

func _on_switch_toggled(p_unused = false) -> void:
	call_deferred("_check_switches")

func _check_switches() -> void:
	if _has_switches_enabled():
		$AnimationPlayer.play("loop")
	else:
		$AnimationPlayer.stop(false)

func _has_switches_enabled() -> bool:
	for switch_node in get_switch_nodes():
		if not switch_node.enabled:
			return false
	return true

func get_switch_nodes() -> Array:
	var nodes = []
	for switch_path in switches:
		nodes.push_back(get_node(switch_path))
	return nodes
