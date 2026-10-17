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
		var current_scene = get_tree().current_scene
		
		if current_scene != null:
			if current_scene.scene_file_path == "res://Escenas/menu_principal.tscn":
				return 
	
		if get_tree().paused:
			get_tree().paused = false
			pause_menu_instance.hide()
		else:
			get_tree().paused = true
			pause_menu_instance.show()
