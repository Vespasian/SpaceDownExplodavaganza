extends Node2D

var health
signal dead

func _ready():
	health = 5

func _process(delta):
	print(health)


func _on_spaceship_hit():
	health = health - 1
	if health == 0:
		emit_signal("dead")
