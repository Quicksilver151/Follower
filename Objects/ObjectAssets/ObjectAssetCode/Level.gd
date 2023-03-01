extends MarginContainer

var Level = 0
var unlocked = false
onready var TextBox:RichTextLabel = $RichTextLabel

func _ready():
	TextBox.bbcode_text = "[center]?"
	if Global.unlocked_levels >= Level or Global.LEVEL_UNLOCK_OVERRIDE:
		unlocked = true
		TextBox.bbcode_text = "[center]" + str(Level)

func _on_Button_pressed():
	if unlocked:
		SceneChanger.change_scene("res://Scenes/Levels/Level"+str(Level)+".tscn")
	else:
		pass #TODO add some effect
