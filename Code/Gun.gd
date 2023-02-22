extends StaticBody2D

export (float, 0.1, 2, 0.01) var speed = 1.0
export (PackedScene) var BulletScene = preload("res://Objects/ObjectAssets/Bullet.tscn")

func _ready():
	$AnimationPlayer.playback_speed = speed


func shoot():
	var bullet_instance = BulletScene.instance()
	
	add_child(bullet_instance)
	
	pass
