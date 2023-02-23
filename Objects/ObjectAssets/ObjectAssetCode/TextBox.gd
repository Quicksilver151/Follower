tool
extends RichTextLabel

export (float, 0.1, 2, 0.1) var scale = 1 setget setter, getter

func _ready():
	pass

func setter(val):
	rect_scale = Vector2(val,val)

func getter():
	return rect_scale.x
