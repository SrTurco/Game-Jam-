extends Node2D

@onready var player = $CharacterBody2D


func accionar():
	if Input.is_action_just_pressed("interactuar") and player.inside_collision:
	
		if player.collision_door_bathroom:
			get_tree().change_scene_to_file("res://Escenas/baño_sala.tscn")
			player.collision_door_bathroom = false
	
