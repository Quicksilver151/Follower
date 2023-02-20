extends KinematicBody2D


var speed = 420
var direction = Vector2.ZERO

var jump_buffer = 0
var jump_allow_time = 0

func _physics_process(delta):
	
	Global.player_position = global_position
	
	if (get_parent().get_node("Tiles").get_pos_tile(global_position) == "spike"):
		Global.death()
		queue_free()
	
	top_down_movement(delta)
	

func top_down_movement(delta):
	
	var x = 0
	if !SceneChanger.is_changing_scene():
		x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
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
	
	wrap()
	direction = move_and_slide(direction*speed)/speed

func wrap():
	var screen_edge = get_viewport_rect()
	
	var in_range = round(position.x) in range(-10,screen_edge.size.x+10)
	
	if in_range:
		if   position.x > screen_edge.size.x:
			position.x = screen_edge.position.x + 1
		elif position.y > screen_edge.size.y: 
			position.y = screen_edge.position.y + 1
		elif position.x < screen_edge.position.x:
			position.x = screen_edge.size.x - 1
		elif position.y < screen_edge.position.y:
			position.y = screen_edge.size.y - 1
		


