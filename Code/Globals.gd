extends Node


func _ready():
	VisualServer.set_default_clear_color(Color.from_hsv(0,0,0.5))
	Overlay.get_node("MarginContainer/Filter").modulate = Color.from_hsv(0.625,0.4,0.6)

func _input(event):
	if event.is_action_pressed("f_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen

