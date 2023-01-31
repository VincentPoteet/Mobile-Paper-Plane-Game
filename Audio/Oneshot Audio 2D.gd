extends AudioStreamPlayer2D



func _on_Oneshot_Audio_2D_finished() -> void:
	queue_free()
