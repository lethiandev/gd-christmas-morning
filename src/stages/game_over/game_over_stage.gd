extends Node

func _ready():
	Transition.fade_in()
	$Tween.interpolate_property(MusicPlayer.get_node("AudioStreamPlayer"), "volume_db", -10, -22, 2.0)
	$Tween.start()

func _on_timer_timeout():
	Dialogue.dialog_start([
		{ "who": "player", "what": "You did it! You've helped the Elf to enjoy the Christmas Morning with his family together!" },
		{ "who": "player", "what": "Thanks for playing!" },
		{ "who": "player", "what": "I made this game for Remco as a Secret Santa Jam #2021 gift, I hope you liked it!" },
		{ "who": "player", "what": "Merry Christmas!" },
		{ "who": "player", "what": "..." },
		{ "who": "player", "what": "..." },
		{ "who": "player", "what": "..." },
		{ "who": "player", "what": "And happy new year!" },
	])
