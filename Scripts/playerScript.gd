extends CharacterBody2D

@onready var label = $"../Label"
const SPEED = 450

var playerPosition = GlobalInteractuable.playerPosition

var objeto_actual = null

func _ready():
	label.hide()

func open_google_search(query: String) -> void:
	var base_url = "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
	var encoded_query = query.uri_encode()
	var full_url = base_url + encoded_query
	var _err = OS.shell_open(full_url)

func _unhandled_input(event: InputEvent) -> void:

	if event.is_action_pressed("open_google"):
		var search_query = "Godot Engine tutorial en español"
		open_google_search(search_query)

func _process(_delta: float) -> void:
	
	playerPosition = self.global_position
	
	if objeto_actual != null and Input.is_action_just_pressed("interactuar"):
		objeto_actual.accionar()
		print("accionado")

func _physics_process(_delta):
	var direccion = Input.get_vector("left", "right", "up", "down")
	
	if direccion:
		velocity.x = direccion.x * SPEED 
		velocity.y = direccion.y * SPEED 
	else:
		velocity.x = move_toward(velocity.x, 0 , SPEED)
		velocity.y = move_toward(velocity.y , 0 , SPEED)
		
	move_and_slide()

func interactuable(objeto):
	objeto_actual = objeto

# colisiones de radares
func player_collision_with_object(_body: CharacterBody2D):
	label.text = "Press E to go to the bathroom"
	label.show()
	interactuable($"../acceso_baño")

func player_quit_collision_area(_body: CharacterBody2D):
	label.hide()
	objeto_actual = null

func _on_juego_tubos_body_entered(_body: CharacterBody2D):
	label.text = "Press E to interact"
	label.show()
	interactuable($"../rotacion de tubos")

func _on_juego_tubos_body_exited(_body: CharacterBody2D):
	label.hide()
	objeto_actual = null

func _on_back_to_living_room_body_entered(_body: CharacterBody2D):
	label.text = "Press E to interact"
	label.show()
	interactuable($"../backToLivingRoom")

func _on_back_to_living_room_body_exited(_body: CharacterBody2D):
	label.hide()
	objeto_actual = null

func _on_juego_parchear_body_entered(_body: CharacterBody2D):
	label.text = "Press E to interact"
	label.show()
	interactuable($"../juego parchear")

func _on_juego_parchear_body_exited(_body: CharacterBody2D):
	label.hide()
	objeto_actual = null

func _on_acceso_cocina_body_entered(_body: CharacterBody2D):
	label.text = "Press E to got to the Kitchen"
	label.show()
	interactuable($"../acceso_cocina")

func _on_acceso_cocina_body_exited(_body: CharacterBody2D):
	label.hide()
	objeto_actual = null

func _on_sotano_room_body_entered(_body: CharacterBody2D):
	label.text = "Press E to got to the Basement"
	label.show()
	interactuable($"../sotanoRoom")

func _on_sotano_room_body_exited(_body: CharacterBody2D):
	label.hide()
	objeto_actual = null
