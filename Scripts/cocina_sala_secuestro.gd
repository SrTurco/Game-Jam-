extends Node2D

@onready var timer = $Timer
@onready var label = $Label

func _ready():
	GlobalInteractuable.etapaSecuestro = true
	iniciar_dialogo()

func escribir_texto(texto_completo: String, duracion: float):
	# 1. Asignamos el texto al Label
	label.text = texto_completo
	
	# 2. Empezamos con cero caracteres visibles
	label.visible_characters = 0
	
	# 3. Creamos un Tween para animar la cantidad de letras visibles
	var tween = create_tween()
	
	# Animamos la propiedad 'visible_characters' desde 0 hasta el total de letras
	tween.tween_property(
		label, 
		"visible_characters", 
		texto_completo.length(), 
		duracion
	)
	
	# 4. Esperamos a que el Tween termine de escribir antes de continuar con la función
	await tween.finished

func iniciar_dialogo():
	await escribir_texto("Client: (Glancing at his watch)\nWell, that was quick. Very efficient.", 2.0)
	await get_tree().create_timer(5.0).timeout
	
	await escribir_texto("Omar: Yes, everything’s taken care of.
	Here’s the invoice.", 2.0)
	await get_tree().create_timer(5.0).timeout
	label.add_theme_color_override("font_color", Color.DARK_RED)
	await escribir_texto("Client: (Ignoring the paper) Do you know what 
	I was thinking about while you were down there?
	I was thinking about how quickly a body drains
	once the right pipe is opened up.", 2.0)
	await get_tree().create_timer(10.0).timeout
	label.add_theme_color_override("font_color", Color.WHITE)
	await escribir_texto("Omar: Uh... I don’t follow you.
	I really need to be going, sir.", 2.0)
	await get_tree().create_timer(5.0).timeout
	label.add_theme_color_override("font_color", Color.DARK_RED)
	await escribir_texto("Client: (Pulling out a weapon)
	Oh, you’re not going anywhere.
	You see, you’ve fixed the water pipes...
	but now you’re going to help me test 
	out the new drain the one for blood.
	Back to the basement. Slowly.", 2.0)
	await get_tree().create_timer(10.0).timeout
	get_tree().change_scene_to_file("res://Escenas/sotano_sala.tscn")
