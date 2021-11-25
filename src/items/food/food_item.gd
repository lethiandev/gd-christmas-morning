extends Area2D
tool

export var score = 10

export var sprite_frame: int \
	setget set_sprite_frame, get_sprite_frame

func _ready() -> void:
	if not Engine.is_editor_hint():
		$Tween.start_animation($Sprite)

func interact_eat(p_player: Node2D) -> void:
	$CollisionShape2D.disabled = true
	$FollowTarget.follow(p_player)
	$Tween.stop_all()

func set_sprite_frame(p_frame: int) -> void:
	$Sprite.frame = p_frame

func get_sprite_frame() -> int:
	return $Sprite.frame

func _on_follow_done(p_player: Node2D):
	queue_free()
