extends Area2D

# Movement speed
# Signal, was ausgesendet wird, wenn man getroffen wird
signal hit
var speed = 500
var viewportSize
var spriteSize
var shotScene = preload("res://laser.tscn")
var dead = false

# Called when the node enters the scene tree for the first time.
func _ready():
	viewportSize = get_viewport().size
	position.x = viewportSize.x / 2
	position.y = viewportSize.y - 75
	var sprite = get_node("Sprite")
	spriteSize = sprite.get_rect().size * sprite.scale

func _process(delta):
	if dead:
		return
	if Input.is_action_pressed("ui_left"):
		position.x -= speed * delta
	if Input.is_action_pressed("ui_right"):
		position.x += speed * delta
	if Input.is_action_pressed("ui_up"):
		position.y -= speed * delta
	if Input.is_action_pressed("ui_down"):
		position.y += speed * delta
	position.x = clamp(position.x, spriteSize.x / 2, viewportSize.x - (spriteSize.x / 2))
	position.y = clamp(position.y, spriteSize.y / 2, viewportSize.y - (spriteSize.y / 2))
	
	if Input.is_action_just_pressed("player_shoot"):
		var shot = shotScene.instance()
		shot.position.x = position.x
		shot.position.y = position.y - spriteSize.y + 19
		get_parent().add_child(shot)

func _on_spaceship_area_entered(area):
	if not "laser" in area.get_name():
		emit_signal("hit")
		area.queue_free()

func _on_health_dead():
	if dead:
		return
	dead = true
	get_node("AnimationPlayer").play("die")
	get_node("AudioStreamPlayer").play()

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "die":
		queue_free()
