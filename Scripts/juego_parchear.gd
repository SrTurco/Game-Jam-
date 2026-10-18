extends Area2D



func accionar():
	if Input.is_action_just_pressed("interactuar"):
		$"../parchear".global_position = Vector2(0,0)
	
