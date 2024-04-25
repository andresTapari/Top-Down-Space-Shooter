extends Area2D

var SPEED = 200				# Velocidad de movimiento

func _process(delta):
	# decrementamos posición en y 
	position.y -= SPEED * delta 

# se ejecuta cuando el nodo sale de la pantalla
func _on_visible_on_screen_notifier_2d_screen_exited():
	# lo eliminamos
	queue_free()

# se ejecuta cuando un área entra en la zona de detección
func _on_area_entered(area):
	# si el área es del grupo enemy
	if area.is_in_group("enemy"):
		# se elimina
		queue_free()
