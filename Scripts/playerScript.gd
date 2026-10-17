extends CharacterBody2D

@onready var label = $"../Label"



const SPEED = 450

var inside_collision = false
var onScreen = false

var collision_door_bathroom = false
var mini_bathroom = false

var playerPosition = GlobalInteractuable.playerPosition


func _ready():
	print(get_node_or_null("/root/GlobalInteractuable"))
	label.hide()


func _process(delta: float) -> void:
	
	playerPosition = self.global_position
	


func _physics_process(delta):
	var direccion = Input.get_vector("left", "right", "up", "down")
	
	if direccion:
		velocity.x = direccion.x * SPEED 
		velocity.y = direccion.y * SPEED 
	else:
		velocity.x = move_toward(velocity.x, 0 , SPEED)
		velocity.y = move_toward(velocity.y , 0 , SPEED)
		
	move_and_slide()

func interactuar(objeto):
	if Input.is_action_just_pressed("interactuar"):
		print("interactuar")
		interactuable(objeto)

# Al entrar a la colission de tal objeto (aun no se sabe el objeto)
func player_collision_with_object(body):
	inside_collision = true
	label.text = "Presionar E para ir al baño"
	label.show()
	interactuable($"../acceso_baño")

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

func interactuable(objeto):
	if GlobalInteractuable.playerPosition == objeto.global_position:
		if Input.is_action_just_pressed("interactuar"):
			objeto.accionar()
			print("accionado")
