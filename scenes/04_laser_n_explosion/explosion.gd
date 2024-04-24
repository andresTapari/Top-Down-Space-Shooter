extends AnimatedSprite2D

# Se ejecuta cuando la animación termina
func _on_animation_finished():
	# eliminamos el nodo
	queue_free()
