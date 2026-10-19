extends Node2D

func _ready():
	if GlobalInteractuable.etapaSecuestro and GlobalInteractuable.bañoMinijuego and GlobalInteractuable.cocinaMinijuego and GlobalInteractuable.laberintoMinijuego:
		$laberintojuego.global_position = Vector2(-1000, -1000)
		$BackToKitchen.global_position = Vector2(-1000, -1000)
		$quitarLavaropa.global_position = Vector2(1603, 482)
		$TimerEscape.start()
		$TimerAyuda.start()

func _on_timer_ayuda_timeout():
	$Label.text = "Press O for help"

func _process(_delta):
	if GlobalInteractuable.laberintoMinijuego:
		$etapaSecuestro.global_position = Vector2(1004, 168)
		$BackToKitchen.global_position = Vector2(-1000, -1000)

func _on_timer_escape_timeout():
	get_tree().change_scene_to_file("res://Escenas/lose.tscn")
