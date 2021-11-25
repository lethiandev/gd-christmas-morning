extends KinematicBody2D

const GRAVITY = Vector2.DOWN * 400

var linear_velocity = Vector2()

func _physics_process(p_delta: float) -> void:
	# Update body motion
	var lv = linear_velocity
	var snap = Vector2(0, 4) if lv.y > 0 and is_on_floor() else Vector2()  
	linear_velocity = move_and_slide_with_snap(lv, snap, Vector2.UP, true)
	
	# Apply gravity to the body
	linear_velocity += GRAVITY * p_delta
