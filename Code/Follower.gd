extends KinematicBody2D

var direction = Vector2.ZERO
var speed = 300
var follow = false
onready var player = get_parent().get_node("Player")

func _ready():
	pass


func _physics_process(delta):
	
	follower_movement(delta)
	detect_finish_line()


func follower_movement(delta):
	direction.y += 10*delta
	
	if follow and abs(player.position.x - position.x) > 38:
		
		direction.x = Vector2((player.position.x - position.x),0).normalized().x
	else:
		direction.x = 0
	
	if direction.x < 0:
		$AnimatedSprite.flip_h = true
	elif direction.x > 0:
		$AnimatedSprite.flip_h = false
	
	
	direction = move_and_slide(direction*speed)/speed
	


func detect_finish_line():
	
	if get_parent().get_node("Tiles").is_at_finish_line(global_position) and !$Sounds/Finish.playing and !SceneChanger.get_node("AnimationPlayer").is_playing():
		$Sounds/Finish.play()
		yield($Sounds/Finish,"finished")
		
		SceneChanger.change_scene("res://Scenes/Levels/Level"+str(int(get_parent().name.lstrip("Level"))+1)+".tscn")
		
	
		


func _on_PlayerDetector_body_entered(body):
	if body.name == "Player":
		$AnimatedSprite.animation = "heart_idle"
		if !follow:
			$Sounds/Activate.play()
			$Particles2D.emitting = true
		follow = true

