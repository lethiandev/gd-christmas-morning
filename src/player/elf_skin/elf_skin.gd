extends Node2D

var is_on_floor = true
var is_flipped = false
var is_moving = false
var is_jumping = false

func _process(p_delta: float) -> void:
	$Sprite.flip_h = is_flipped
	# Update animation parameters
	$AnimationTree["parameters/conditions/is_on_floor"] = is_on_floor
	$AnimationTree["parameters/conditions/is_airborne"] = not is_on_floor
	$AnimationTree["parameters/conditions/is_moving"] = is_moving
	$AnimationTree["parameters/conditions/is_standing"] = not is_moving
	# When airborne
	$AnimationTree["parameters/airborne/conditions/is_rising"] = is_jumping
	$AnimationTree["parameters/airborne/conditions/is_falling"] = not is_jumping
	$AnimationTree["parameters/airborne/conditions/is_on_floor"] = is_on_floor
	$AnimationTree["parameters/airborne/conditions/is_airborne"] = not is_on_floor
