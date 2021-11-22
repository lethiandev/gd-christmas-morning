extends KinematicBody2D

func _physics_process(p_delta: float) -> void:
	var motion = Vector2(0, 10)
	var snap = Vector2(0, 4)
	move_and_slide_with_snap(motion, snap, Vector2.UP, true)
