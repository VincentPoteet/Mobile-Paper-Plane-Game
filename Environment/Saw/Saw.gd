extends KinematicBody2D


export var speed = 70
export var initial_angle = 0

var direction = Vector2.ZERO
var velocity = Vector2.ZERO

func _ready() -> void:
	direction = Vector2(1, 0).rotated(deg2rad(initial_angle))
	velocity = direction * speed


func _physics_process(delta: float) -> void:
	direction = direction.normalized()
	var collision =  move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
