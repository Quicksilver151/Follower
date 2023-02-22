extends MarginContainer

var Level = 0
onready var TextBox:RichTextLabel = $RichTextLabel

func _ready():
	TextBox.bbcode_text = "[center]" + str(Level)


func _on_Button_pressed():
	SceneChanger.change_scene("res://Scenes/Levels/Level"+str(Level)+".tscn")
