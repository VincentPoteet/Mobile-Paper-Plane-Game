extends Position2D

export var can_spawn = true
export var distance_from_player = 160
export var object = preload("res://Environment/Coin/Coin.tscn")

var player = null



func _ready() -> void:
	player = null


func _physics_process(delta: float) -> void:
	if not player:
		player = Signalbus.player
	#spawn
	if player and can_spawn:
		if position.distance_to(player.position) <= distance_from_player:
			if get_child_count() == 0:
				var inst = object.instance()
				add_child(inst)
	
	#KILL
	if get_child_count() > 0 and position.distance_to(player.position) > distance_from_player:
		for child in get_children():
			child.queue_free()




func _receive_player_node(node):
	player = node
