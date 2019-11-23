extends Area2D

var dx = 0
var dy = 500
var screenHeight

func _ready():
	screenHeight = get_viewport().size.y

func _process(delta):
	position.x += dx * delta
	position.y += dy * delta

	if position.y > screenHeight:
		queue_free()
