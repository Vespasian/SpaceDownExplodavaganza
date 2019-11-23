extends Timer

var level = 1
signal level_up

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_level_upper_timeout():
	level += 1
	emit_signal('level_up',level)
	get_child(randi()%4).play()
	pass # Replace with function body.
