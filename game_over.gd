extends Node2D

var score = 0

func _ready():
	get_node("Node2D/RichTextLabel").bbcode_text = "[center]" + str(score) + "[/center]"

func _process(delta):
	if Input.is_action_pressed("player_shoot"):
		get_tree().change_scene("res://MainScene.tscn")
