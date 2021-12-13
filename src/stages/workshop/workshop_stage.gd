extends Node

func _ready():
	yield(get_tree().create_timer(5.0, false), "timeout")
	Dialogue.dialog_start([
		{ "who": "player", "what": "Sorry, that's all what I've prepared so far." },
		{ "who": "player", "what": "You can quit now the game, that's all for today." },
		{ "who": "player", "what": "TBC." },
		{ "who": "player", "what": "Remember to like and subscribe!" },
		{ "who": "player", "what": "..." },
		{ "who": "player", "what": "I think I've forgot about someting..." },
		{ "who": "player", "what": "Ah right! Merry Christmas!" },
		{ "who": "player", "what": "Bye!" },
		{ "who": "player", "what": "Bye bye!" },
		{ "who": "player", "what": "Thanks for your companion... but now you can go." },
		{ "who": "player", "what": "..." },
		{ "who": "player", "what": "I hope you'll get bored eventually..." },
		{ "who": "player", "what": "I hope you'll get bored eventually..." },
		{ "who": "player", "what": "I hope you'll get bored eventually..." },
		{ "who": "player", "what": "I hope you'll get bored eventually..." },
		{ "who": "player", "what": "I hope you'll get bored eventually..." },
		{ "who": "player", "what": "Ha! I'm sure I made you think that's a loop, didn't I?" },
		{ "who": "player", "what": "Ok seriously, now you can go, Merry Christmas!" },
	])
