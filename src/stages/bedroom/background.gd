extends ColorRect
tool

func _ready() -> void:
	VisualServer.canvas_item_set_z_index(get_canvas_item(), -10)
