extends Node

var pause_menu = preload("res://Escenas/pause_menu.tscn")
var pause_menu_instance: Node



func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	
	# Instanciamos el menú y lo añadimos a la pantalla de forma global
	pause_menu_instance = pause_menu.instantiate()
	get_tree().root.add_child.call_deferred(pause_menu_instance)
	
	# Lo ocultamos al inicio
	pause_menu_instance.hide()

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		var new_pause_state: bool = !get_tree().paused
		get_tree().paused = new_pause_state
		
		# Mostramos u ocultamos el menú según el estado de la pausa
		if new_pause_state:
			pause_menu_instance.show()
		else:
			pause_menu_instance.hide()
