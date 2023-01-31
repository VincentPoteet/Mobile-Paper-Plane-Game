extends Sprite

export var rotation_speed = 10

export var moving = true
var time = 0
export var frequency = 2.5
export var magnitude = 110

func _physics_process(delta: float) -> void:
	rotate(rotation_speed * delta)
	if moving:
		time += delta
		var movement = cos(time * frequency) * magnitude
		global_position.y  = owner.global_position.y + (movement * delta) + 1
		global_position.x = owner.position.x
