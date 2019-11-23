extends Timer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var level = 1
var spawn_timer = 30
var powerupScene = preload("res://powerup.tscn")
var screenWidth

func _ready():
	screenWidth = get_viewport().size.x

func _on_powerup_spawn_timeout():
	var powerup = powerupScene.instance()
	powerup.position.x = rand_range(0, screenWidth)
	get_parent().add_child(powerup)
