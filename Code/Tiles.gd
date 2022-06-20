extends TileMap

func _ready():
	pass

func get_pos_tile(playerpos):
	var tile_pos = world_to_map(playerpos/4)
	var tile = get_cellv(tile_pos)
	if tile == 0:
		return "finish"
	if tile == 2:
		return "spike"
	return "air"
	


