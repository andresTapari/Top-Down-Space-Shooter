extends Node2D

# Variables de exportacion
## Velocidad con la que se mueve el fondo
@export var SPEED: int = 50

# Variables
var backGroundElements: Array = []			# Lista de elementos del fondo

func _ready():
	# Cargamos elementos de lista
	backGroundElements = %Path2D.get_children()

func _process(delta):
	# Por cada elemento de la lista
	for element in backGroundElements:
		# Aumentamos su progreso con la velocidad
		element.progress += SPEED * delta
