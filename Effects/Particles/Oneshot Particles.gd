extends CPUParticles2D

func _ready() -> void:
	yield(get_tree().create_timer(lifetime * 2, false), "timeout")
	queue_free()

