extends CanvasLayer



func _ready():
	$AnimationPlayer.play("fade_in")

func _process(delta):
	calculate_center_with_gaps()

func is_changing_scene():
	return $AnimationPlayer.is_playing()

func change_scene(scene_path:String):
	var err = 0
	
	if !is_instance_valid(load(scene_path)):
		scene_path = "res://Scenes/Menu.tscn"
	
	
	if !$AnimationPlayer.is_playing():
		get_tree().get_root().set_disable_input(true)
		$AnimationPlayer.play_backwards("fade_in")
		yield($AnimationPlayer,"animation_finished")
		err = get_tree().change_scene(scene_path)
		
		
		yield(get_tree().create_timer(0.5),"timeout")
		$AnimationPlayer.play("fade_in")
		yield($AnimationPlayer,"animation_finished")
		get_tree().get_root().set_disable_input(false)
		





func calculate_center_with_gaps():
	$HBoxContainer/Right.size_flags_stretch_ratio = 1 - $HBoxContainer/Left.size_flags_stretch_ratio
	$VBoxContainer/Bottom.size_flags_stretch_ratio = 1 - $VBoxContainer/Top.size_flags_stretch_ratio
	
	var position_percentage = Global.player_position / $VBoxContainer.rect_size
	
	$HBoxContainer/Left.size_flags_stretch_ratio = position_percentage.x
	$VBoxContainer/Top.size_flags_stretch_ratio = position_percentage.y
	
	



