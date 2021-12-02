extends Area2D

export var score = 10

func _ready() -> void:
	$Tween.start_animation($Sprite)

func interact_eat(p_player: Node2D) -> void:
	$CollisionShape2D.disabled = true
	$FollowTarget.follow(p_player)
	$Tween.stop_all()

func _on_follow_done(p_player: Node2D):
	queue_free()
