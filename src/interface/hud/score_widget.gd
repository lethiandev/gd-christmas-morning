extends HBoxContainer

func _ready() -> void:
	set_score(0)

func set_score(p_score: int) -> void:
	$Label.text = "%06d" % p_score
