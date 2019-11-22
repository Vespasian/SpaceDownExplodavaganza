extends Area2D

# Movement speed
var speed = 250
var screenWidth
var screenHeight
var sizeX
var sizeY

# Called when the node enters the scene tree for the first time.
func _ready():
	screenHeight = get_viewport().size.y
	screenWidth = get_viewport().size.x
	position.x = screenWidth / 2
	position.y = screenHeight - 75
	var sprite = get_node("Sprite")
	var spriteScale = sprite.scale
	sizeX = sprite.texture.get_size().x * spriteScale.x
	sizeY = sprite.texture.get_size().y * spriteScale.y
	

func _process(delta):
	if Input.is_action_pressed("ui_left"):
		position.x -= speed * delta
	if Input.is_action_pressed("ui_right"):
		position.x += speed * delta
	if Input.is_action_pressed("ui_up"):
		position.y -= speed * delta
	if Input.is_action_pressed("ui_down"):
		position.y += speed * delta
	position.x = clamp(position.x, 0 + (sizeX / 2), screenWidth - (sizeX / 2))
	position.y = clamp(position.y, 0 + (sizeY / 2), screenHeight - (sizeY / 2))





