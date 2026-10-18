extends Area2D

func accionar():
	if GlobalInteractuable.etapaSecuestro:
		get_tree().change_scene_to_file("res://Escenas/cocina_sala_secuestro.tscn")
	else:
		get_tree().change_scene_to_file("res://Escenas/cocina_sala.tscn")
