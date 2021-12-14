extends Node

func play_door_transition() -> void:
	$DoorTransition.play()

func play_door_locked() -> void:
	$DoorLocked.play()
