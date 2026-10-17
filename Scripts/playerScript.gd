extends CharacterBody2D

@onready var label = $"../Label"
@onready var tubos = $"../rotacion de tubos"


const SPEED = 450

var inside_collision = false
var onScreen = false

func _ready():
	label.hide()


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interactuar") and inside_collision:
	# Primero evaluamos si YA estaban en pantalla para quitarlos
		if onScreen:
			tubos.global_position = Vector2(-1370, -1000)
			onScreen = false 

		else:
			tubos.global_position = Vector2(370, 310)
			onScreen = true


func _physics_process(delta):
	var direccion = Input.get_vector("left", "right", "up", "down")
	
	if direccion:
		velocity.x = direccion.x * SPEED 
		velocity.y = direccion.y * SPEED 
	else:
		velocity.x = move_toward(velocity.x, 0 , SPEED)
		velocity.y = move_toward(velocity.y , 0 , SPEED)
		
	move_and_slide()

# Al entrar a la colission de tal objeto (aun no se sabe el objeto)
func player_collision_with_object(body):
	inside_collision = true
	label.text = "Presionar E para interactuar"
	label.show()
	if inside_collision:
		# aca tiene que ir el puzzle o la interaccion adecuada
		pass

func player_quit_collision_area(body):
	inside_collision = false
	label.hide()

func minijuego_baño(body):
	label.text = "Presionar E para interactuar"
	label.show()
	inside_collision = true
	

func minijuego_baño_exit(body):
	inside_collision=false
	label.hide()
