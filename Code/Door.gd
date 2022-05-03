extends RigidBody2D


var set_rotation = 0
var current_rotation = 0

func _ready():
	set_rotation = round(rotation_degrees)
	


func _process(delta):
	current_rotation = lerp(current_rotation,90*Global.switch_phase+set_rotation,0.5)
	$CollisionShape2D.disabled = !(round(current_rotation) == 90*Global.switch_phase+set_rotation)
	set_deferred("rotation_degrees",current_rotation)
	
	
	
	


