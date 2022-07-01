extends MarginContainer


func _ready():
	pass



func _input(event):
	if event.is_action_pressed("ui_cancel"):
		SceneChanger.change_scene("")
