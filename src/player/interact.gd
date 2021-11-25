extends Area2D

func _ready():
	connect("area_entered", self, "_on_area_entered")

func _on_area_entered(p_area: Area2D) -> void:
	if p_area.is_in_group("edible"):
		p_area.interact_eat(get_parent())
