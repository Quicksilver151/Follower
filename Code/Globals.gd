extends Node

var switch_phase = 0

onready var player_position = get_viewport().size/2

func _ready():
#	VisualServer.set_default_clear_color(Color.from_hsv(0,0,0.5))
	VisualServer.set_default_clear_color(Color("bfbfbf"))
	#Overlay.get_node("MarginContainer/Filter").modulate = Color.from_hsv(0.625,0.4,0.6)

func _input(event):
	if event.is_action_pressed("f_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
	
	if event.is_action_pressed("f_reload"):
		get_tree().reload_current_scene()
	


func _process(delta):
	gradient_background(delta)
	

func gradient_background(delta,sat=60,val=85):
	Overlay.get_node("MarginContainer/Filter").modulate.h += delta/30
	Overlay.get_node("MarginContainer/Filter").modulate.s = sat/100.0
	Overlay.get_node("MarginContainer/Filter").modulate.v = val/100.0

# TODO: get to reset after each level
func increment_switch_phase():
	switch_phase += 1
	if switch_phase >= 100:
		switch_phase = 0
	

