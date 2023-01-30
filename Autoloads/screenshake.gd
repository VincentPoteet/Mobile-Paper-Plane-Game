extends Node

var strength = 0
var decay = 20


func _physics_process(delta: float) -> void:
	strength = max(lerp(strength, 0, decay * delta), 0)
