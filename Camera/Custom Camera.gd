extends Camera2D

var rand = RandomNumberGenerator.new()

func _ready() -> void:
	rand.randomize()


func _physics_process(delta: float) -> void:
	var offset_random
	offset_random = rand.randf_range(-Screenshake.strength, Screenshake.strength)
	offset = Vector2(offset_random, offset_random)
