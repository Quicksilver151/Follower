extends Control

onready var button:Array = [
	$VBoxContainer/MarginContainer/HBoxContainer/Buttons/Start,
	$VBoxContainer/MarginContainer/HBoxContainer/Buttons/Options,
	$VBoxContainer/MarginContainer/HBoxContainer/Buttons/Exit,
	]

var line:Array = [Vector2.ZERO,Vector2.ZERO]

func _ready():
	$VBoxContainer/MarginContainer/HBoxContainer/Buttons/Start.grab_focus()
	

var a = 20
func _process(_delta):
	
	line[0] = lerp(get_focus_owner().rect_global_position,line[0],0.75)
	line[1] = lerp(get_focus_owner().rect_global_position+Vector2(0,80),line[1],0.75)
	
	update()

func _draw():
	
	draw_line(line[0],line[1],Color(1,1,1,1),10)

func _on_Start_pressed():
	pass


func _on_Options_pressed():
	print("WIP")


func _on_Exit_pressed():
	get_tree().quit()
