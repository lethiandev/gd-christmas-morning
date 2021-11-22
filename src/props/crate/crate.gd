extends KinematicBody2D

func _physics_process(p_delta: float) -> void:
	var motion = Vector2(0, 10)
	move_and_slide(motion, Vector2.UP, true)
