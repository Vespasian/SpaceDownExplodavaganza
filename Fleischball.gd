extends Sprite

# Declare member variables here. Examples:
var dx = 0
var dy = 30
# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = 200
	position.y = 200

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += dy * delta