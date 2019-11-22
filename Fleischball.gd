extends Node2D

# Declare member variables here. Examples:
var dx = 0
var dy = 30
var spriteSize

func _ready():
	spriteSize = get_node("Sprite").texture.get_size().y
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += dx * delta
	position.y += dy * delta
	
	if position.y > get_viewport().size.y + spriteSize:
		queue_free()
