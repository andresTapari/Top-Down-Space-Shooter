extends Control

# Esta funcion se dispara cuando se presiona el botón
func _on_button_pressed():
	# Cambiamos escena al del nivel
	get_tree().change_scene_to_file(Definitions.MAIN_LVL)
