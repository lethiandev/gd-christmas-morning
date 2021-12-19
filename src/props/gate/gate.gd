extends StaticBody2D

signal gate_opened()
signal gate_closed()

export var wait_time = 4.0
export var has_timer = true

var opened = false \
	setget set_open, is_opened

func is_opened() -> bool:
	return opened

func set_open(p_open: bool) -> void:
	if opened != p_open:
		opened = p_open
		_toggle_gate()

func _toggle_gate() -> void:
	$CollisionShape2D.disabled = opened
	$Sprite.frame = 1 if opened else 0
	if opened and has_timer:
		$TimerPlayer.play()
		$Timer.start()
	elif has_timer:
		$TimerPlayer.stop()
		$Timer.stop()
	emit_signal("gate_opened" if opened else "gate_closed")

func _ready() -> void:
	$Timer.wait_time = wait_time
	$Timer.connect("timeout", self, "set_open", [false])
