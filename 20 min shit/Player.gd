extends Area2D
class_name player

signal spawn_laser(location)

var speed = 300

onready var muzzle = $Muzzle

var input_vector = Vector2.ZERO

var hp = 3

func _physics_process(delta):
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	global_position += input_vector * speed * delta
	
	if Input.is_action_just_pressed("ui_accept"):
		shoot_laser()


func take_damage(damage):
	hp -= damage
	if hp <= 0:
		queue_free()


func _on_Area2D_area_entered(area):
	if area.is_in_group("enemies"):
		area.take_damage(1)

func shoot_laser():
	emit_signal("spawn_laser", muzzle.global_position)
