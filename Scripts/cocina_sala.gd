extends Node2D

func _process(delta):
	if GlobalInteractuable.bañoMinijuego and GlobalInteractuable.cocinaMinijuego:
		$cantGoBasement.global_position = Vector2(-1000, -1000)
		$sotanoRoom.global_position = Vector2(1685, 497)
