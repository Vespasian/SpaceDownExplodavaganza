extends Node2D

var dx = 0
var dy = -500

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += dx * delta
	position.y += dy * delta

	if position.y < 0:
		queue_free()
