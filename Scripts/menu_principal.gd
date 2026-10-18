extends Node2D

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Escenas/menuOmar.tscn")
	

func _on_tutorial_pressed():
	get_tree().change_scene_to_file("res://Escenas/tutorial.tscn")
	

func _on_quit_pressed():
	get_tree().quit()
