extends Control

onready var button:Array = [
	$VBoxContainer/MarginContainer/HBoxContainer/Buttons/Start,
	$VBoxContainer/MarginContainer/HBoxContainer/Buttons/Options,
	$VBoxContainer/MarginContainer/HBoxContainer/Buttons/Exit,
	]

var line:Array = [Vector2.ZERO,Vector2.ZERO]

func _ready():
	$CanvasLayer/Version.text = "Version: "+Global.VERSION
	$VBoxContainer/MarginContainer/HBoxContainer/Buttons/Start.grab_focus()
	

var a = 20
var focus_move_pos = Vector2.ZERO
func _process(_delta):
	
	line[0] = lerp(get_focus_owner().rect_global_position,line[0],0.75)
	line[1] = lerp(get_focus_owner().rect_global_position+Vector2(0,80),line[1],0.75)
	
	# move focus
	
	$Camera2D.position = $FocusArea.position/50 + rect_size/2
	
	$Camera2D.rotation = -(rect_size/2+Vector2(-540,0)).angle_to($FocusArea.position)/20
	
	$FocusArea.position = lerp(focus_move_pos,$FocusArea.position,0.6)
	
	
	update()

func _input(event):
	if event is InputEventMouseMotion:
		focus_move_pos = get_global_mouse_position()
	if event is InputEventKey:
		focus_move_pos = get_focus_owner().rect_global_position

func _draw():
	
#	draw_circle($FocusArea.position,2,Color.aliceblue)
#	draw_circle(rect_size/2+Vector2(-540,0),20,Color.aliceblue)
	draw_line(line[0],line[1],Color("#bfbfbf"),10)

func _on_Start_pressed():
	$ClickSound.play()
	yield($ClickSound,"finished")
	get_tree().change_scene("res://Scenes/Levels/Level1.tscn")
	pass


func _on_Levels_pressed():
	$ClickSound.play()
	yield($ClickSound,"finished")
	get_tree().change_scene("res://Scenes/LevelSelect.tscn")


func _on_Options_pressed():
	$ClickSound.play()
	yield($ClickSound,"finished")
	
	print("Oh the irony")


func _on_Exit_pressed():
	
	$ClickSound.play()
	yield($ClickSound,"finished")
	
	get_tree().quit()

