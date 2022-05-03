extends Area2D

var active = false


func _ready():
	pass


func _input(event):
	if !event.is_action_pressed("ui_accept"):
		return
	
	for body in get_overlapping_bodies():
		if body.name == "Player":
			active = !active
			Global.increment_switch_phase()
	
	$Sprite.frame = 0
	if active:
		$Sprite.frame = 1
	
	





