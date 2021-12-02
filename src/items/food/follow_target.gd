extends Node

signal follow_done(target_node)

var follow_node: Node2D

func _physics_process(p_delta: float) -> void:
	if follow_node == null:
		return
	
	# Update target follow motion
	if is_instance_valid(follow_node):
		_follow_target(follow_node)
	else:
		emit_signal("follow_done", null)
		follow_node = null

func _follow_target(p_target: Node2D) -> void:
	var target = p_target.global_position
	var from = get_parent().global_position
	
	# Reached the target
	if from.distance_to(target) < 6.0:
		emit_signal("follow_done", p_target)
	
	# Move towards the target
	var next_step = from.linear_interpolate(target, 0.15)
	get_parent().global_position = next_step

func follow(p_target: Node2D) -> void:
	follow_node = p_target
