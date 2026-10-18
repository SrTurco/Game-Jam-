extends Node2D

var francesa = false
var destornillador = false
var picoLoro = false

func _ready() -> void:
	$Label.hide()

var tornillosSacados = 0

var escape = false

func _process(_delta: float) -> void:
	var mouse_pos: Vector2 = get_viewport().get_mouse_position()
	
	if francesa:
		$herramientas/francesa.global_position = mouse_pos
	if destornillador:
		$herramientas/destornillador.global_position = mouse_pos
	if picoLoro:
		$herramientas/picoLoro.global_position = mouse_pos
	
	if tornillosSacados >= 4:
		$VentilacionV01.hide()
		$Area2D.global_position = Vector2(965, 665)
		$herramientas.global_position = Vector2(-2000,-2000)
		$tornillosHandler.global_position = Vector2(-2000,-2000)
		if destornillador or francesa or picoLoro:
			destornillador = false
			francesa = false
			picoLoro = false
	

func _input(event):
	var mouse_pos: Vector2 = get_viewport().get_mouse_position()
	
	if escape:
		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if $Area2D.is_in_group("escape"):
				var rect: Rect2 = $Area2D.get_rect()
				var local_mouse_pos: Vector2 = $Area2D.to_local($Area2D.global_position + (mouse_pos - $Area2D.global_position))
				if rect.has_point(local_mouse_pos):
					get_tree().change_scene_to_file("res://Escenas/winEscena.tscn")
	
	if francesa:
		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			for tornillo: Sprite2D in get_tree().get_nodes_in_group("tornillo_puesto"):
				if tornillo.visible:
					var rect: Rect2 = tornillo.get_rect()
					var local_mouse_pos: Vector2 = tornillo.to_local(tornillo.global_position + (mouse_pos - tornillo.global_position))
					if rect.has_point(local_mouse_pos):
						$Label.show()
						$Label.text = "I´m using the wrong tool"
						$Label/Timer.start()

		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			$herramientas/francesa.global_position = Vector2(341, 69)
			francesa = false
	
	if destornillador:
		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			for tornillo: Sprite2D in get_tree().get_nodes_in_group("tornillo_puesto"):
				if tornillo.visible:
					var rect: Rect2 = tornillo.get_rect()
					var local_mouse_pos: Vector2 = tornillo.to_local(tornillo.global_position + (mouse_pos - tornillo.global_position))
					if rect.has_point(local_mouse_pos):
							tornillo.hide()
							tornillosSacados += 1
						# Buscar hijos ocultos del handler y mostrar uno aleatorio
							var hijos_ocultos = []
							for hijo in $tornilloCaidoHandler.get_children():
								if not hijo.visible:
									hijos_ocultos.append(hijo)
							if hijos_ocultos.size() > 0:
								var indice_aleatorio = randi() % hijos_ocultos.size()
								hijos_ocultos[indice_aleatorio].show()
								
					

		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			$herramientas/destornillador.global_position = Vector2(834, 69)
			destornillador = false
	
	if picoLoro:
		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			for tornillo: Sprite2D in get_tree().get_nodes_in_group("tornillo_puesto"):
				if tornillo.visible:
					var rect: Rect2 = tornillo.get_rect()
					var local_mouse_pos: Vector2 = tornillo.to_local(tornillo.global_position + (mouse_pos - tornillo.global_position))
					if rect.has_point(local_mouse_pos):
						$Label.show()
						$Label.text = "I´m using the wrong tool"
						$Label/Timer.start()
		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			$herramientas/picoLoro.global_position = Vector2(1307, 69)
			picoLoro = false
	

func _on_francesa_pressed():
	francesa = true

func _on_destornillador_pressed():
	destornillador = true

func _on_pico_loro_pressed():
	picoLoro = true

func _on_timer_timeout():
	$Label.hide()

func _on_area_2d_mouse_entered():
	escape = true

func _on_area_2d_mouse_exited():
	escape = false
