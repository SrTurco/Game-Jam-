extends Area2D

func accionar():
	$"../SotanoAsset".global_position = Vector2(590, 755)
	$"../ventilacionJuego".global_position = Vector2(1635, 470)
	
	# Desactivar este Area2D para que no interfiera con ventilacionJuego
	monitoring = false
	monitorable = false
	$CollisionShape2D.set_deferred("disabled", true)
	
	# Limpiar la referencia del jugador
	var player = $"../CharacterBody2D"
	if player and player.objeto_actual == self:
		player.objeto_actual = null
	
	$".".global_position = Vector2(-10000, -100000)
