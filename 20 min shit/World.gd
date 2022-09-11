extends Node2D

var score = 0

var laser = preload("res://playerlaser.tscn")

func _on_player_spawn_laser(location):
	var l = laser.instance()
	l.global_position = location
	add_child(l)
	
