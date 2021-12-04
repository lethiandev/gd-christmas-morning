extends Node2D

var is_flipped = false

var is_on_floor = false
var is_moving = false

var falling_speed = 0.0

func _process(p_delta: float) -> void:
	$Sprite.flip_h = is_flipped
	# Update animation state
	$AnimationTree["parameters/conditions/is_moving"] = is_moving
	$AnimationTree["parameters/conditions/is_standing"] = not is_moving
	$AnimationTree["parameters/conditions/is_on_floor"] = is_on_floor
	$AnimationTree["parameters/conditions/is_airborne"] = not is_on_floor
	# Update airborne state
	$AnimationTree["parameters/airborne/blend_position"] = falling_speed
	
