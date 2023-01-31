extends Area2D

export var health = 1

var died = false

func _physics_process(delta: float) -> void:
	if health <= 0 and not died:
		died = true
		get_tree().reload_current_scene()


func _on_Hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("hurtbox") and not died:
		health -= 1
