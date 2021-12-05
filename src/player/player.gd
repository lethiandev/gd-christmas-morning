extends KinematicBody2D

const GRAVITY = 400.0
const ACCELERATION = 600.0
const DECELERATION = 800.0
const WALK_SPEED = 100.0
const JUMP_STRENGTH = 160

var input_move = 0.0
var input_jump = false

var linear_velocity = Vector2()

var coyote_time = 0.0
var jumping_count = 0
var jumping_time = 0.0

var jumpoff_time = 0.0
var hurt_time = 0.0

func _process(p_delta: float) -> void:
	# Update camera
	var view_factor = -1.0 if $Skin.is_flipped else 1.0
	$Camera2D.position.x = lerp($Camera2D.position.x, 24.0 * view_factor, 0.25)
	
	# Update particle emitters
	var has_speed = abs(linear_velocity.x) > WALK_SPEED * 0.75
	$DustEmitter.emitting = is_on_floor() and has_speed
	
	# Update skin parameters
	if not is_equal_approx(input_move, 0):
		$Skin.is_flipped = input_move < 0
	
	$Skin.is_on_floor = is_on_floor()
	$Skin.is_moving = not is_equal_approx(linear_velocity.x, 0)
	$Skin.falling_speed = linear_velocity.y
	
	# Update skin material
	if hurt_time > 0.0:
		hurt_time = max(0.0, hurt_time - p_delta)
		$Skin.material.set_shader_param("blink_timer", hurt_time)

func _physics_process(p_delta: float) -> void:
	# Apply player input
	input_move = Input.get_axis("move_left", "move_right")
	input_jump = Input.is_action_just_pressed("jump")
	
	_update_move_action(p_delta)
	_update_jump_action(p_delta)
	_update_platform_mask(p_delta)
	
	# Update collision
	var lv = linear_velocity
	var snap = Vector2(0.0, 4.0) if coyote_time > 0.0 else Vector2.ZERO
	linear_velocity = move_and_slide_with_snap(lv, snap, Vector2.UP, true)
	
	# Apply gravity acceleration
	linear_velocity.y += GRAVITY * p_delta
	linear_velocity.y = min(linear_velocity.y, GRAVITY)

func _update_move_action(p_delta: float) -> void:
	if not is_equal_approx(input_move, 0):
		var accel = ACCELERATION * p_delta
		_move_accelerate(accel * input_move)
	elif is_on_floor():
		var decel = DECELERATION * p_delta
		_move_decelerate(decel)

func _move_accelerate(p_accel: float) -> void:
	var xflip = linear_velocity.x * sign(p_accel)
	var xspeed = clamp(WALK_SPEED - xflip, 0, abs(p_accel))
	linear_velocity.x += xspeed * sign(p_accel)

func _move_decelerate(p_decel: float) -> void:
	var xsign = sign(linear_velocity.x)
	var xspeed = abs(linear_velocity.x)
	linear_velocity.x -= min(p_decel, xspeed) * xsign

func _update_jump_action(p_delta: float) -> void:
	coyote_time = max(0.0, coyote_time - p_delta)
	
	if input_jump:
		jumping_time = 0.15
	elif jumping_time > 0.0:
		jumping_time -= p_delta
	
	if is_on_floor():
		jumping_count = 0
		coyote_time = 0.2
	
	# Jumping - Double jump
	if coyote_time <= 0.0 and input_jump and jumping_count < 1:
		$Skin.is_jumping = true
		linear_velocity.y = -JUMP_STRENGTH
		jumping_count += 1
	
	# Jumping - Normal jump
	if coyote_time > 0.0 and jumping_time > 0.0:
		$Skin.is_jumping = true
		linear_velocity.y = -JUMP_STRENGTH
		jumping_time = 0.0
		coyote_time = 0.0

func _update_platform_mask(p_delta: float) -> void:
	if Input.is_action_just_pressed("move_down"):
		set_collision_mask_bit(2, false)
		jumpoff_time = 0.15
	
	if jumpoff_time > 0.0:
		jumpoff_time = max(0, jumpoff_time - p_delta)
	elif is_equal_approx(jumpoff_time, 0.0):
		set_collision_mask_bit(2, true)
		jumpoff_time = -1.0

func item_eat(p_item: Node) -> void:
	$ChewPlayer.play()
