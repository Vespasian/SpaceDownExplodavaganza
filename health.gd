extends Node2D

var health
signal dead
var emptyHealth = preload("res://sprites/health-empty.png")
var fullHealth = preload("res://sprites/health-full.png")

func _ready():
	health = 5

#func _process(delta):


func _on_spaceship_hit():
	health = health - 1
	update_health_display()
	if health > 0:
		get_node("pain" + str(5-health)).play()

	if health == 0:
		emit_signal("dead")

func _on_spaceship_powerup():
	if health < 5:
		health = health + 1
	update_health_display()

func update_health_display():
	for i in range(1, 6):
		var texture = emptyHealth
		if health >= i:
			texture = fullHealth
		get_node("h" + str(i)).set_texture(texture)
