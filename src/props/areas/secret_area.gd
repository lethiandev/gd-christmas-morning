extends Area2D

func _ready() -> void:
	connect("body_entered", self, "_on_body_entered")
	connect("body_exited", self, "_on_body_exited")

func _on_body_entered(p_body: PhysicsBody2D) -> void:
	_tween_modulate(modulate, Color(1,1,1,0))

func _on_body_exited(p_body: PhysicsBody2D) -> void:
	_tween_modulate(modulate, Color(1,1,1,1))

func _tween_modulate(p_from: Color, p_to: Color) -> void:
	$Tween.remove_all()
	$Tween.interpolate_property(self, "modulate", p_from, p_to, 0.1)
	$Tween.start()
