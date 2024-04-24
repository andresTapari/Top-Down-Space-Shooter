extends Control

# Se establece el puntaje
func set_score(new_score: int) -> void:
	%LabelScore.text = str(new_score)

# Se ejecuta cuando se presiona el boton
func _on_button_pressed():
	get_tree().paused = false
	# Vuelve a cargar la escena actual
	get_tree().reload_current_scene()
