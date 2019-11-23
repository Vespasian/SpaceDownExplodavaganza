extends Timer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var level = 1
var spawn_timer = 1.0
var enemyScene = preload("res://fleischball.tscn")
var screenWidth

func _ready():
	screenWidth = get_viewport().size.x

func _on_enemy_spawn_timeout():
	var enemy = enemyScene.instance()
	enemy.position.x = rand_range(0, screenWidth)
	get_parent().add_child(enemy)
	wait_time = spawn_timer


func _on_level_upper_level_up(newLevel):
	level = newLevel
	spawn_timer *= 0.9
	wait_time = max(0.2, spawn_timer)
	print(level)
	pass # Replace with function body.
