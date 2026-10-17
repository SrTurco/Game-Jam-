extends Node2D


func _on_texture_button_pressed():
	# Quitamos la pausa global del juego
	get_tree().paused = false
	# Ocultamos este menú
	hide()
