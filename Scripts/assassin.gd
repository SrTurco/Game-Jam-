extends CharacterBody2D

@onready var label = $Label

func _ready():
	label.text = "
	Please repair the bathroom sink pipe, 
	the water pipe in the kitchen, 
	and a leak from the utility
	sink faucet in the basement.
	"

func _process(delta):
	if GlobalInteractuable.bañoMinijuego:
		label.text = "
	Please repair the water pipe in the kitchen, 
	and a leak from the utility
	sink faucet in the basement.
	"
	if GlobalInteractuable.cocinaMinijuego and not GlobalInteractuable.bañoMinijuego:
		label.text = "
	Please repair the bathroom sink pipe, 
	and a leak from the utility 
	sink faucet in the basement.
	"
	if GlobalInteractuable.cocinaMinijuego and GlobalInteractuable.bañoMinijuego:
		label.text = "
	Please repair a leak from the utility 
	sink faucet in the basement.
	"
	
