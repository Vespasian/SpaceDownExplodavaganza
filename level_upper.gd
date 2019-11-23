extends Timer

var level = 1
signal level_up
var sound_node

# Called when the node enters the scene tree for the first time.
func _ready():
	sound_node = get_child(0)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_level_upper_timeout():
	level += 1
	emit_signal('level_up',level)
	sound_node.play()
	pass # Replace with function body.
