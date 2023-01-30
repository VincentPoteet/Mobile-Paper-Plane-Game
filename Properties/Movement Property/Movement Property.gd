extends Node2D

export var max_speed = 80
export var acceleration = 150
export var deceleration = 150
export (String, "Input", "Player", "Forwards") var target
export var move_only_when_turning = false

var direction = Vector2.ZERO
var velocity = Vector2.ZERO

var can_accelerate = true
var left_button_held = false
var right_button_held = false


func _ready() -> void:
	Signalbus.connect("left_button_held", self, "_left_button_is_held")
	Signalbus.connect("right_button_held", self, "_right_button_is_held")


func _process(delta: float) -> void:
	set_can_accelerate()
	set_direction()
	move(delta)



func move(delta):
	if can_accelerate:
		if direction != Vector2.ZERO:
			velocity = velocity.move_toward(max_speed * direction, (acceleration + deceleration) * delta)
		
	velocity = velocity.move_toward(Vector2.ZERO, deceleration * delta)
		
	velocity = owner.move_and_slide(velocity)



func set_direction():
	match target:
		"Input":
			direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
			direction.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
			direction = direction.normalized()
		
		"Player":
			pass
		
		"Forwards":
			direction = Vector2(1, 0).rotated(owner.global_rotation)


func _left_button_is_held(held):
	left_button_held = held

func _right_button_is_held(held):
	right_button_held = held

func set_can_accelerate():
	if move_only_when_turning:
		if Input.get_action_strength("steer_left") or Input.get_action_strength("steer_right"):
			can_accelerate = true
		else:
			can_accelerate = false
