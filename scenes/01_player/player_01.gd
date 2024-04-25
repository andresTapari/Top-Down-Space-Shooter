extends Area2D

# Variables:
var SPEED: 	int = 200			# Velocidad con la que se mueve el jugador
var xScreenLimit: int = 0		# Limite maximo de la pantalla

func _ready():
	# Obtenemos el tamaño de la pantalla
	xScreenLimit = ProjectSettings.get("display/window/size/viewport_width")

func _process(delta):
	# Si se presiona la tecla del cursor derecha -> y esta dentro de la pantalla
	if Input.is_action_pressed("ui_right") and position.x < xScreenLimit:
		# Incrementamos la posición actual
		position.x += SPEED*delta
		# Reproducimos animación derecha
		%AnimatedSprite2D.play("right")

	# Sino, si se presiona la tecla del cursor izquierda <- y esta dentro de la pantalla
	elif Input.is_action_pressed("ui_left") and position.x > 0:
		# Decrementamos la posición actual
		position.x -= SPEED*delta
		# Reproducimos animación izquierda
		%AnimatedSprite2D.play("left")

	# Si no se presiona nada:
	else:
		# Reproduce animación por defecto
		%AnimatedSprite2D.play("idle")
