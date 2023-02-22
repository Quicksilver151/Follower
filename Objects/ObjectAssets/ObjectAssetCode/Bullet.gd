extends Area2D

var SPEED = 500
var Direction = Vector2.ZERO


func _ready():
	pass

func _physics_process(delta):
	position += Vector2.UP.rotated(rotation) * SPEED * delta
	
	if  global_position.x > 0 and\
		global_position.x < get_viewport_rect().size.x and\
		global_position.y > 0 and\
		global_position.y < get_viewport_rect().size.y:
		return
	
	queue_free()

func _on_Bullet_body_entered(body):
	if body.name == "Player":
		Global.death()
		queue_free()
	if body.name != get_parent().name:
		queue_free()

