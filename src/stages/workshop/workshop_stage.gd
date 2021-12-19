extends Node

func _ready():
	Transition.fade_in()

func _on_door_entered():
	GameState.timer_stop()
