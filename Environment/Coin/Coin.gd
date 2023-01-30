extends Area2D

var player
var follow_speed = 100
var following_player = false
var follow_trigger_distance = 30
var death_particles = preload("res://Environment/Coin/Coin Particles.tscn")
var shake_strength = 2
var time_freeze_length = 0.05
var time_freeze_scale = 0.7

func _ready() -> void:
	Signalbus.connect("send_player_node", self, "_receive_player_node")


func _process(delta: float) -> void:
	trigger_following_player()
	follow_player(delta)


func _on_Coin_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		$Sprite.modulate = Color(100,100,100)
		$Sprite.scale = Vector2(1.2, 1.2)
		$AudioStreamPlayer2D.pitch_scale = rand_range(0.9, 1.1)
		$AudioStreamPlayer2D.play()
		spawn_particles()
		screenshake()
		Timefreeze.time_freeze(time_freeze_scale, time_freeze_length)
		yield(get_tree().create_timer(0.1, false), "timeout")
		queue_free()


func trigger_following_player():
	if position.distance_to(player.position) <= follow_trigger_distance:
		following_player = true
	else:
		following_player = false

func follow_player(delta):
	if following_player:
		position = position.move_toward(player.position, follow_speed * delta)

func spawn_particles():
	var inst = death_particles.instance()
	inst.global_position = position
	inst.emitting = true
	get_tree().current_scene.add_child(inst)


func screenshake():
	Screenshake.strength = max(Screenshake.strength, shake_strength)

func _receive_player_node(node):
	player = node
