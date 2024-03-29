extends MarginContainer


onready var LevelContainer = $VBoxContainer/ScrollContainer/LevelContainer
export (PackedScene) var LevelObject = preload("res://Objects/ObjectAssets/Level.tscn")


func _ready():
	$CanvasLayer/Version.text = "Version: "+Global.VERSION
	
	var levels = dir_contents("res://Scenes/Levels/")
	
	for level in levels:
		var level_object = LevelObject.instance()
		level_object.Level = level
		LevelContainer.add_child(level_object)
	


func dir_contents(path) -> Array:
	var dir = Directory.new()
	var list = []
	if dir.open(path) == OK:
		dir.list_dir_begin(true)
		var file_name = dir.get_next()
		while file_name != "":
			
			list.append(int(file_name.strip_edges("Level",".tscn")))
			file_name = dir.get_next()
			if dir.current_is_dir():
				continue
			
	
	list.sort()
	list.pop_front()
	
	return list

