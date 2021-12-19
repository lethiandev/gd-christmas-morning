extends HBoxContainer

func set_time(p_time: float) -> void:
	var msc = int(p_time * 100) % 100
	var sec = int(p_time) % 60
	var mnn = int(p_time / 60) % 60
	$Label.text = "%02d:%02d:%02d" % [mnn, sec, msc]
