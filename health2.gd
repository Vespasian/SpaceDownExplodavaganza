extends Node2D

var health
signal dead2
var emptyHealth

func _ready():
	health = 5
	emptyHealth = preload("res://sprites/health-empty.png")


func _on_spaceship2_player2_hit():
	if health > 0:
		get_node("h" + str(health)).set_texture(emptyHealth)
		health = health - 1
				
	if health == 0:
		emit_signal("dead2")
