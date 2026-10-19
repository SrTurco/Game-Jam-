extends Node2D

func _ready():
	$Label.hide()

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var mouse_pos: Vector2 = get_viewport().get_mouse_position()
		
		for canilla: Sprite2D in $canillaPlaceHolder.get_children():
			if canilla.visible:
				var rect: Rect2 = canilla.get_rect()
				var local_mouse_pos: Vector2 = canilla.to_local(canilla.global_position + (mouse_pos - canilla.global_position))
				if rect.has_point(local_mouse_pos):
					if canilla.name == "Canilla3":
						# Canilla correcta - terminar minijuego
						GlobalInteractuable.laberintoMinijuego = true
						
						await get_tree().create_timer(2.0).timeout
						$".".global_position = Vector2(-2000, -2000)
					else: 
						# Canilla incorrecta - mostrar mensaje
						$Label.show()
						$Label.text = "Wrong shutoff valve"
						$TimerProgressBar.start()
					break
	
	if GlobalInteractuable.laberintoMinijuego:

		$".".global_position = Vector2(-2000, -2000)

func _on_timer_progress_bar_timeout():
	$Label.hide()
