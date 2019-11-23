extends Sprite

var score = 0
var label
signal enemy_hit

# Called when the node enters the scene tree for the first time.
func _ready():
	label = get_node("RichTextLabel")
	label.text = str(score)


func _on_score_enemy_hit():
	score += 10
	label.text = str(score)
