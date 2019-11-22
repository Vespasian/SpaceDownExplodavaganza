extends Sprite

# Movement speed
var speed = 250

# Called when the node enters the scene tree for the first time.
func _ready():
	var screenWidth = get_viewport().size.x
	var screenHeight = get_viewport().size.y
	position.x = screenWidth / 2
	position.y = screenHeight - 75
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_left"):
		position.x -= speed * delta
	if Input.is_action_pressed("ui_right"):
		position.x += speed * delta
	if Input.is_action_pressed("ui_up"):
		position.y -= speed * delta
	if Input.is_action_pressed("ui_down"):
		position.y += speed * delta
