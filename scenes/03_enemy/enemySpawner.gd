extends Node2D

# Precargamos el nodo Enemigo
@onready var ENEMY = preload("res://scenes/03_enemy/enemy_03.tscn")

# Variables:
var spawnerSpeed: int = 100				# Velocidad con la que se desplaza el spawner
var rng = RandomNumberGenerator.new()	# Objeto para generar números aleatorios

func _process(delta):
	# Movemos el spawner por la trayectoria
	%PathFollow2D.progress += delta * spawnerSpeed

## Señales
# Cuando se dispare el timer
func _on_timer_timeout():
	# Aleatorizamos la clase rng,
	rng.randomize()
	# Si la clase rng, genera un numero dentro del rango, igual a 1
	if rng.randi_range(0,2) == 1:
		# Creamos enemigo
		var newEnemy = ENEMY.instantiate()
		# Lo hubicamos en el lugar del spawner
		newEnemy.global_position = %PathFollow2D.global_position
		# lo agregamos al arbol del nivel
		get_parent().add_child(newEnemy)
