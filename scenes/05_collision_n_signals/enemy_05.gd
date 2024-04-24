extends Area2D

# Señales
signal destroyed

# Nodos:
@onready var BULLET = preload (Definitions.ENEMY_BULLET)
@onready var EXPLOSION = preload(Definitions.EXPLOSION)

# Variables
var SPEED: int = 100					# velocidad con la que se mueve la nave
var enteredScreen: bool = false			# velocidad 

func _process(delta):
	# Incrementamos la posición
	position.y += SPEED*delta

## Señales:
# Señal que se emite cuando entra en pantalla
func _on_visible_on_screen_notifier_2d_screen_entered():
	# Establecemos en verdadero que la nave entro en pantalla
	enteredScreen = true

# Señal que se emite cuandenemeyo sale de la pantalla
func _on_visible_on_screen_notifier_2d_screen_exited():
	# Si la nave habia entrado en pantalla y ahora sale la eliminamos
	if enteredScreen:
		queue_free()
		# comparamos si habia entrado en pantalla para evitar
		# que se elimine en el momento que se crea fuera de los 
		# limites de la pantalla

# Se ejecuta cuando un área entra en la zona de detección
func _on_area_entered(area):
	if area.is_in_group("playerBullet"):
		# Creamos explosion
		var explosion:AnimatedSprite2D = EXPLOSION.instantiate()
		explosion.global_position = global_position
		get_parent().add_child(explosion)
		# Emitimos señal que la unidad fue destruida
		emit_signal("destroyed")
		# Eliminamos la unidad
		queue_free()

# Se ejecuta cuando el timer dispara
func _on_timer_timeout():
	if randi_range(0,1):
		var bullet = BULLET.instantiate()
		bullet.global_position = global_position
		get_parent().add_child(bullet)
