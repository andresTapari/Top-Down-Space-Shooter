extends CanvasLayer

@onready var GAME_OVER_SCREEN = preload(Definitions.GAME_OVER_SCR)

# Actualiza el puntaje a mostrar en pantalla
func update_score(newScore: int) -> void:
	$LabelScore.text = str(newScore)

func game_over_screen_pop_up(score: int) -> void:
	# Eliminamos etiqueta de puntaje
	$LabelScore.queue_free()
	# Creamos ventana de game over
	var gameOverScreen = GAME_OVER_SCREEN.instantiate()
	# Establecemos puntaje esta nueva ventana
	gameOverScreen.set_score(score)
	# La agregamos al arbol del juego
	add_child(gameOverScreen)
	# Pausamos
	get_tree().paused = true
