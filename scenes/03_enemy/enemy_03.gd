extends Area2D

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

# Señal que se emite cuando sale de la pantalla
func _on_visible_on_screen_notifier_2d_screen_exited():
	# Si la nave habia entrado en pantalla y ahora sale la eliminamos
	if enteredScreen:
		queue_free()
		# (comparamos si habia entrado en pantalla para evitar
		# que se elimine en el momento que se crea fuera de los 
		# limites de la pantalla)
