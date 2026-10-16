extends Node2D

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Escenas/sala_principal.tscn")
	
func _on_tutorial_pressed():
	get_tree().change_scene_to_file("res://Escenas/tutorial.tscn")
	pass # Replace with function body.

func _on_quit_pressed():
	get_tree().quit()
