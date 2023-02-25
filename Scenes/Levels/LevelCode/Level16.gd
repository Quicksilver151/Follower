extends Node2D


func _ready():
	pass

func _process(delta):
	if $ScrollContainer.scroll_vertical > 234:
		Global.increment_switch_phase()
		$ScrollContainer.scroll_vertical = 234
