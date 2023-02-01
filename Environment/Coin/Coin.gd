extends Area2D

onready var player
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
		play_sound()
		spawn_particles()
		screenshake()
		stop_spawning()
		Timefreeze.time_freeze(time_freeze_scale, time_freeze_length)
		yield(get_tree().create_timer(0.1, false), "timeout")
		queue_free()


func trigger_following_player():
	if player:
		if global_position.distance_to(player.position) <= follow_trigger_distance:
			following_player = true
		else:
			following_player = false

func follow_player(delta):
	if following_player:
		global_position = global_position.move_toward(player.position, follow_speed * delta)

func spawn_particles():
	var inst = death_particles.instance()
	inst.global_position = global_position
	inst.emitting = true
	get_tree().current_scene.add_child(inst)


func play_sound():
	var inst = $"Oneshot Audio 2D".duplicate()
	inst.pitch_scale = rand_range(0.9, 1.1)
	inst.play()
	get_tree().current_scene.add_child(inst)

func screenshake():
	Screenshake.strength = max(Screenshake.strength, shake_strength)


func stop_spawning():
	if get_parent().is_in_group("spawner"):
		get_parent().can_spawn = false

func _receive_player_node(node):
	player = node
