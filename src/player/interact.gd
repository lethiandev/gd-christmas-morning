extends Area2D

var interact_queue = []

func _ready():
	connect("area_entered", self, "_on_area_entered")
	connect("area_exited", self, "_on_area_exited")

func _on_area_entered(p_area: Area2D) -> void:
	if p_area.is_in_group("interactive"):
		p_area.interact_enter(get_parent())

func _on_area_exited(p_area: Area2D) -> void:
	if p_area.is_in_group("interactive"):
		p_area.interact_leave(get_parent())

func _process(p_delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		_process_interact()

func _process_interact() -> void:
	for node in get_overlapping_areas():
		if node.is_in_group("interactive"):
			node.interact(get_parent())
