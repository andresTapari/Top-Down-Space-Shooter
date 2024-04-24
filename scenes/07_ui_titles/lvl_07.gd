extends Node2D

var score:      int = 0				# puntaje del juego
var enemyScore: int =1				# puntaje por matar un enemigo

func _ready() -> void:
	# Conectamos señal de notificacion cuando un enemigo es creado
	%EnemySpawner.enemy_created.connect(func (newEnemy):
		# Conectamos cada enemigo creado, a la señal si se destruye
		newEnemy.destroyed.connect(func ():
			# Cuando se destruye actualizamos el puntaje
			score += enemyScore
			# Actualizamos marcador de puntaje
			$Hud.update_score(score)
			)
		)
	# Conectamos señal de player cuando pierde partida
	$Player.game_over.connect(func ():
		# Cuando pierde, hud muestra pantalla de game_over
		$Hud.game_over_screen_pop_up(score)
		)
