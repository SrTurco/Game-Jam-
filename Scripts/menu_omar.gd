extends Node2D

var jugar = false

func _on_timer_timeout():
	jugar = true

func _process(_delta):
	if jugar:
		continuar()

func continuar():
	if Input.is_action_just_pressed("interactuar"):
		get_tree().change_scene_to_file("res://Escenas/sala_principal.tscn")
