extends TileMap

func _ready():
	pass

func is_at_finish_line(playerpos):
	var tile_pos = world_to_map(playerpos/4)
	var tile = get_cellv(tile_pos)
	if tile == 0:
		return true
	return false


