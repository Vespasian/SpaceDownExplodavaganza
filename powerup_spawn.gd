extends Timer

var powerupScene = preload("res://powerup.tscn")
var screenWidth

func _ready():
	screenWidth = get_viewport().size.x

func _on_powerup_spawn_timeout():
	var powerup = powerupScene.instance()
	powerup.position.x = rand_range(0, screenWidth)
	get_parent().add_child(powerup)
