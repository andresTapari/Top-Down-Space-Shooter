extends Area2D

var SPEED = 200				# Velocidad de movimiento

func _process(delta):
	# decrementamos posición en y 
	position.y -= SPEED * delta 

# se ejecuta cuando el nodo sale de la pantalla
func _on_visible_on_screen_notifier_2d_screen_exited():
	# lo eliminamos
	queue_free()

func _on_area_entered(area):
	if area.is_in_group("enemy"):
		queue_free()
