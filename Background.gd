extends Node2D

#90 max
var scrollSpeed = 30
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var tiles = []

var screenWidth = 0
var screenHeight = 0
var tileHeight = 0

var moveTiles = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	
	screenWidth = get_viewport().size.x
	screenHeight = get_viewport().size.y

	position.x = 0
	position.y = 0
	# fill the screen
	var tile = get_child(0)
	tileHeight = tile.texture.get_height() * tile.scale.y
	
	var y = -tileHeight*2
	while (y < screenHeight - tileHeight):
		addTileRow(y, tile)
		y += tileHeight
	#addTileRow(-tileHeight*2, tile)
	#addTileRow(-tileHeight, tile)
	#addTileRow(0, tile)
	#addTileRow(tileHeight, tile)
	#addTileRow(tileHeight*2, tile)
	#addTileRow(tileHeight*3, tile)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	moveTiles += delta * scrollSpeed
	if ( moveTiles < 1):
		return
	
	var diff = floor(moveTiles)
	moveTiles = 0
	
	for tile in tiles:
		tile.position.y += diff
		if ( tile.position.y > screenHeight):
			tile.position.y = -2*tileHeight+ (int(screenHeight) % int(tileHeight) + tile.position.y - screenHeight)
	pass
	
func addTileRow(y, tile):
	var screenWidth = get_viewport().size.x
	var tileWidth = tile.texture.get_width() * tile.scale.x
	var x = 0
	while (x < screenWidth):
		var newTile = tile.duplicate()
		newTile.visible = true
		newTile.position.y = y
		newTile.position.x = x
		add_child(newTile)
		tiles.append(newTile)
		x += tileWidth
	pass
