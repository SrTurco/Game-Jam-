extends Control

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		
		var mouse_pos: Vector2 = get_viewport().get_mouse_position()
		
		for sprite: Sprite2D in get_tree().get_nodes_in_group("sprites_rotables"):
			
			var rect: Rect2 = sprite.get_rect()
			
			var local_mouse_pos: Vector2 = sprite.to_local(sprite.global_position + (mouse_pos - sprite.global_position))
			
			if rect.has_point(local_mouse_pos):
				sprite.rotation_degrees += 90
				break 
