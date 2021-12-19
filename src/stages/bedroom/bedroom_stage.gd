extends Node

func _on_animation_finished(anim_name):
	GameState.timer_start()
	MusicPlayer.play_music()
