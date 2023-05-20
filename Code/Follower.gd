extends KinematicBody2D

export (bool) var h_warp = true
export (bool) var v_warp = true

var direction = Vector2.ZERO
var speed = 300
var follow = false
onready var player = get_parent().get_node("Player")

var on_air = true

func _ready():
	pass


func _physics_process(delta):
	
	follower_movement(delta)
	detect_finish_line()
	wrap()
	
	if direction.y != 0:
		on_air = true
	
	if SceneChanger.is_changing_scene():
		on_air = false
	
	if is_on_floor() and on_air:
		$Sounds/Land.play()
		on_air = false
	

func follower_movement(delta):
	direction.y += 10*delta
	
	if follow and abs(Global.player_position.x - position.x) > 38:
		
		direction.x = Vector2((Global.player_position.x - position.x),0).normalized().x
	else:
		direction.x = 0
	
	if direction.x < 0:
		$AnimatedSprite.flip_h = true
	elif direction.x > 0:
		$AnimatedSprite.flip_h = false
	
	
	direction = move_and_slide(direction*speed,Vector2.UP)/speed
	


func detect_finish_line():
	
	if (get_parent().get_node("Tiles").get_pos_tile(global_position) == "finish") and !$Sounds/Finish.playing and !SceneChanger.get_node("AnimationPlayer").is_playing():
		$Sounds/Finish.play()
		yield($Sounds/Finish,"finished")
		var next_level = int(get_parent().name.lstrip("Level"))+1
		Global.unlocked_levels = next_level if next_level > Global.unlocked_levels else Global.unlocked_levels
		#TODO: relocate scene change code from follower to Global
		SceneChanger.change_scene("res://Scenes/Levels/Level"+str(next_level)+".tscn")
		
	
		


func _on_PlayerDetector_body_entered(body):
	if body.name == "Player":
		$AnimatedSprite.animation = "heart_idle"
		if !follow:
			$Sounds/Activate.play()
			$Particles2D.emitting = true
		follow = true

func wrap():
	var screen_edge = get_viewport_rect()
	
	var in_range = position.x in range(-10,screen_edge.size.x+10)
	
	if h_warp:
		if   position.x > screen_edge.size.x:
			position.x = screen_edge.position.x + 1
		if position.x < screen_edge.position.x:
			position.x = screen_edge.size.x - 1
	if v_warp:
		if position.y > screen_edge.size.y: 
			position.y = screen_edge.position.y + 1
		if position.y < screen_edge.position.y:
			position.y = screen_edge.size.y - 1
		


