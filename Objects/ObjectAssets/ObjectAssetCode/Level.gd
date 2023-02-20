extends MarginContainer

export (int) var Level = 1

func _ready():
	$RichTextLabel.text = str(Level)

func _on_Button_pressed():
	SceneChanger.change_scene("res://Scenes/Levels/Level"+str(Level)+".tscn")
