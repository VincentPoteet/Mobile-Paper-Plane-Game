extends Sprite

func _physics_process(delta: float) -> void:
	global_position = owner.position + Vector2(0, 5)
