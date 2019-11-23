extends Node2D

# Declare member variables here. Examples:
var dx = 0
var dy = 30

var jitter = 0.2
var min_shot = 0.5
var max_shot = 2

var spriteSize
var sizeY
signal enemy_hit
var enemyShotScene = preload("res://enemy_shot.tscn")
var timer

func _ready():
	var sprite = get_node("Sprite")
	spriteSize = sprite.texture.get_size().y
	var spriteScale = sprite.scale
	sizeY = spriteSize * spriteScale.y
	timer = get_node("spawn_shot")
	timer.wait_time = rand_range(min_shot, max_shot)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += dx * delta
	position.y += dy * delta
	
	if position.y > get_viewport().size.y + spriteSize:
		queue_free()


func _on_Fleischball_area_entered(area):
	if area.get_name() == 'shot':
		queue_free()


func _on_spawn_shot_timeout():
	var shot = enemyShotScene.instance()
	shot.position.x = position.x
	shot.position.y = position.y + (sizeY / 2)
	get_parent().add_child(shot)
	
	timer.wait_time = clamp(timer.wait_time + rand_range(-jitter,jitter), min_shot, max_shot)
