extends Node2D

<<<<<<< HEAD
@onready var tubos = $"."

@export var global_position_x = -1368
@export var global_position_y = -713

func _input(event: InputEvent) -> void:
=======
# tubo 1, 3, 4, 8, 13, 14 pueden estar en 90 o 270 grados
# 2, 5, 15, 17 pueden estar 0 o 180 grados
# 6 en 180
#7 en 270
#9 y 16 en todas las pos
# 10 en 90
# 11 en 90 o 270
# 12 en 0

var accionado = false
var miniCompletado = false
var tiempo_restante = -1.0

func _process(delta):
	if tiempo_restante > 0:
		tiempo_restante -= delta
		if tiempo_restante <= 0:
			$"../Label2".hide()

# Diccionario con los grados válidos para cada tubo (por nombre de nodo)
# tubo 9 y tubo 16 son cruces (X), válidos en cualquier posición, no se verifican
var grados_validos = {
	"tubo 1": [90, 270],
	"tubo 2": [0, 180],
	"tubo 3": [90, 270],
	"tubo 4": [90, 270],
	"tubo 5": [0, 180],
	"tubo 6": [180],
	"tubo 7": [270],
	"tubo 8": [90, 270],
	"tubo 10": [90],
	"tubo 11": [90, 270],
	"tubo 12": [0],
	"tubo 13": [90, 270],
	"tubo 14": [90, 270],
	"tubo 15": [0, 180],
	"tubo 17": [0, 180],
}

func tubosConectados():
	
	for nombre in grados_validos.keys():
		var tubo = get_node_or_null(nombre)
		if tubo == null:
			return
		
		var grados = int(round(tubo.rotation_degrees)) % 360
		if grados < 0:
			grados += 360
		
		if grados not in grados_validos[nombre]:
			print("Tubo incorrecto: ", nombre, " está en ", grados, "° - válidos: ", grados_validos[nombre])
			return
	
	# Si llegamos acá, todos los tubos están en la posición correcta
	miniCompletado = true
	
	if miniCompletado:
		GlobalInteractuable.bañoMinijuego = true
		self.global_position = Vector2(-2000, -2000)
		$"../Label2".show()
		$"../Label2".text = "Pipe fixed, lets go for another task."
		tiempo_restante = 5.0


func _input(event: InputEvent) -> void:
	
>>>>>>> 6714b55d85596be56103120c0d0c2c2dcc5beecd
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		
		var mouse_pos: Vector2 = get_viewport().get_mouse_position()
		
		for sprite: Sprite2D in get_tree().get_nodes_in_group("sprites_rotables"):
			
			var rect: Rect2 = sprite.get_rect()
			
			var local_mouse_pos: Vector2 = sprite.to_local(sprite.global_position + (mouse_pos - sprite.global_position))
			
			if rect.has_point(local_mouse_pos):
				sprite.rotation_degrees += 90
<<<<<<< HEAD
				break 
=======
				if sprite.rotation_degrees >= 360:
					sprite.rotation_degrees = 0
				tubosConectados()
				break 

func accionar():
	if not GlobalInteractuable.bañoMinijuego :
		if accionado:
			self.global_position = Vector2(-1370, -1000)
			accionado = false
		else:
			self.global_position = Vector2(-5, -1)
			accionado = true
	else:
		$"../Label".text = "Pipe already fixed, its better dont touch it."
>>>>>>> 6714b55d85596be56103120c0d0c2c2dcc5beecd
