extends Area2D


func accionar():
	if not GlobalInteractuable.cocinaMinijuego:
		if Input.is_action_just_pressed("interactuar"):
			$"../parchear".global_position = Vector2(0,0)
	else:
		$"../Label".text = "Pipe fixed. Go for another task"
	
