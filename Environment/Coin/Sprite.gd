extends Sprite


var time = 0
var frequency = 2.5
var magnitude = 110

func _physics_process(delta: float) -> void:
	time += delta
	var movement = cos(time * frequency) * magnitude
	global_position.y  = owner.global_position.y + (movement * delta) + 1
	global_position.x = owner.position.x
	
	rotation += 1.5 * delta
