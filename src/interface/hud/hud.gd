extends CanvasLayer

onready var score_widget = $ViewportContainer/Viewport/HBoxContainer/ScoreWidget
onready var timer_widget = $ViewportContainer/Viewport/HBoxContainer/TimerWidget

func _ready() -> void:
	GameState.connect("score_changed", score_widget, "set_score")
	GameState.connect("timer_changed", timer_widget, "set_time")
