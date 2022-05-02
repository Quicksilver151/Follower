extends KinematicBody2D


var speed = 420
var direction = Vector2.ZERO

var jump_buffer = 0
var jump_allow_time = 0

func _physics_process(delta):
	
	
	top_down_movement(delta)
	

func top_down_movement(delta):
	
	var x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	
	# Jump Safety
	if Input.is_action_just_pressed("ui_jump"):
		jump_buffer = 0.1
	
	if (is_on_wall() or is_on_floor()):
		jump_allow_time = 0.15
	
	jump_buffer = max(jump_buffer-delta,0)
	jump_allow_time = max(jump_allow_time-delta,0)
	
	if jump_buffer and (jump_allow_time):
		jump_buffer = 0
		direction.y = -3
	
	
	direction.y += 10*delta
	
	direction.x = lerp(direction.x,x,0.4)
	
	direction = move_and_slide(direction*speed)/speed
