extends Node

signal score_changed(score)
signal timer_changed(time)

var score = 0
var timer = 0.0

func _ready() -> void:
	set_physics_process(false)

func _physics_process(p_delta: float) -> void:
	timer += p_delta
	emit_signal("timer_changed", timer)

func add_score(p_score: int) -> void:
	score += p_score
	emit_signal("score_changed", score)

func timer_start() -> void:
	set_physics_process(true)

func timer_stop() -> void:
	set_physics_process(false)
