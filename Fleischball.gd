extends Node2D

# Declare member variables here. Examples:
var dx = 0
var dy = 30
signal enemy_hit

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += dx * delta
	position.y += dy * delta
	
	if position.y > get_viewport().size.y:
		queue_free()

func _on_Fleischball_area_entered(area):
	queue_free()
