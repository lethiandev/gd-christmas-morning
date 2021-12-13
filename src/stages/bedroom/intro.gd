extends AnimationPlayer

func fade_in() -> void:
	Transition.fade_in()

func dialog_start() -> void:
	Dialogue.dialog_start([
		{ "who": "player", "what": "Oh no! I'm late!" },
		{ "who": "player", "what": "What I'm going to do!" },
		{ "who": "player", "what": "Press arrows keys to move around." },
		{ "who": "player", "what": "Press Z key to jump and X key to interact with objects." },
	])
