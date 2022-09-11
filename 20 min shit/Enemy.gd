extends Area2D

signal enemy_died

export (int) var speed = 150

var hp = 1

func _physics_process(delta):
	global_position.y += speed * delta

func take_damage(damage):
	hp -= damage
	if hp <= 0:
		queue_free()


func _on_enemy_area_entered(area):
	if area is player:
		area.take_damage(1)
