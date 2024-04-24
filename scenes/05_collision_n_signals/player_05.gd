extends Area2D

# Señales:
signal game_over

# Nodos:
@onready var BULLET    = preload(Definitions.PLAYER_BULLET)
@onready var EXPLOSION = preload(Definitions.EXPLOSION)

# Variables:
var SPEED: 	int = 200			# Velocidad con la que se mueve el jugador
var xScreenLimit: int = 0		# Limite maximo de la pantalla
var weaponEn: bool = true		# Habilita disparar el arma
var cadencia: float = 0.25		# Tiempo a esperar entre disparos

func _ready():
	# Obtenemos el tamaño de la pantalla
	xScreenLimit = ProjectSettings.get("display/window/size/viewport_width")
	%WeaponTimer.wait_time = cadencia

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
		%AnimatedSprite2D.play("idle")

	# Si presionamos botón disparar (Barra Espaciadora) 
	# y esta permitido disparar
	if Input.is_action_pressed("ui_shoot") and weaponEn:
		# desactivamos el arma
		weaponEn = false
		# Iniciamos timer
		%WeaponTimer.start()
		# Creamos municion
		var newBullet = BULLET.instantiate()
		newBullet.global_position = %Muzle.global_position
		get_parent().add_child(newBullet)

# Cuando el timer dispare
func _on_weapon_timer_timeout():
	# Habilitamos el arma
	weaponEn = true

# Se ejecuta cuando un area entra en la zona de deteccion de player
func _on_area_entered(area):
	if area.is_in_group("enemy") or area.is_in_group("enemyBullet"):
		# ocultamos sprite
		%AnimatedSprite2D.visible = false
		# detenemos movimiento
		SPEED = 0
		# creamos explosion
		var explosion = EXPLOSION.instantiate()
		explosion.global_position = global_position
		get_parent().add_child(explosion)
		# Notificamos que se perdio la partida
		emit_signal("game_over")

