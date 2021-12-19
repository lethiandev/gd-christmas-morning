extends Area2D

export var score = 10

func _ready() -> void:
	$Tween.start_animation($Sprite)

func interact_enter(p_other: Node2D) -> void:
	$FollowTarget.follow(p_other)
	$Tween.stop_all()

func _on_follow_done(p_player: Node2D):
	GameState.add_score(10)
	SoundEffects.play_chew()
	queue_free()
