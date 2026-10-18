extends Node2D

@onready var epoxi = $Epoxi

var positionEpoxi = 0

var colission_entered = false

var holes = [
	"holefixed1", "holefixed2", "holefixed3", "holefixed4", "holefixed5",
]

func _ready():
	positionEpoxi = epoxi.global_position
	
var agarrado = false

func _process(_delta):
	var mouse_pos: Vector2 = get_viewport().get_mouse_position()
	
	if agarrado:
		epoxi.global_position = mouse_pos
		
	
func _input(event):
	var mouse_pos: Vector2 = get_viewport().get_mouse_position()
	for sprite: Sprite2D in get_tree().get_nodes_in_group("holes_fixed"):
		var rect: Rect2 = sprite.get_rect()
		var local_mouse_pos: Vector2 = sprite.to_local(sprite.global_position + (mouse_pos - sprite.global_position))
		if rect.has_point(local_mouse_pos):
				sprite.show()
				
	
	if colission_entered:
		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			for hole in holes:
				
				var agujero = get_node_or_null(hole)
				if agujero == null:
					return
				
				
				
				pass
			pass
	
	if agarrado:
		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			epoxi.global_position = positionEpoxi
			agarrado = false
	
func _on_texture_button_pressed():
	agarrado = true

func _on_hole_1_mouse_entered():
	colission_entered = true
	
func _on_hole_1_mouse_exited():
	colission_entered = false
	
