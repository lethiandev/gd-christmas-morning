extends Area2D
tool

export var limit = Vector2(320, 180) \
	setget set_limit, get_limit

func set_limit(p_limit: Vector2) -> void:
	limit = p_limit
	update()

func get_limit() -> Vector2:
	return limit

func _ready() -> void:
	if not Engine.is_editor_hint():
		connect("body_entered", self, "_on_body_entered")

func _on_body_entered(p_body: PhysicsBody2D) -> void:
	var origin = global_transform.origin
	var camera_limit = Rect2(origin - limit * 0.5, limit)
	p_body.set_camera_limit(camera_limit)

func _draw() -> void:
	if Engine.is_editor_hint():
		var rect = Rect2(limit * -0.5, limit)
		draw_rect(rect, Color.greenyellow, false, 2.0)
