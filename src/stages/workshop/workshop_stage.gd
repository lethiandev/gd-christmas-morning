extends Node

func _ready():
	yield(get_tree().create_timer(2.0), "timeout")
	Dialogue.dialog_start([
		{ "who": "player", "what": "Sorry, that's all what I've prepared so far" },
		{ "who": "player", "what": "You can quit now the game, there's nothing more" },
	])
