extends KinematicBody2D

export(float) var velocidade_maxima: float
export(float) var aceleracao: float
export(float) var gravidade: float
export(float) var forca_de_pulo: float

var _velocidade: Vector2

func _physics_process(delta: float) -> void:
	# Pegar os inputs do jogador
	var direcao: Vector2 = Vector2.ZERO
	
	if Input.is_action_pressed("andar_para_direita"):
		direcao.x += 1
	if Input.is_action_pressed("andar_para_esquerda"):
		direcao.x -= 1
	
	if Input.is_action_pressed("pular") && is_on_floor():
		print("pulor")
		_velocidade.y -= forca_de_pulo
	
	# Pegar a velocidade, e descartar o y. 
	# Vamos primeiro calcular a velocidade horizontal e dps adicionar gravidade
	var lvdir = _velocidade
	lvdir.y = 0
	
	var velocidade_alvo = direcao.normalized() * velocidade_maxima
	var accel = -aceleracao
	
	if(lvdir.dot(_velocidade) > 0):
		accel = aceleracao
	
	lvdir = lvdir.linear_interpolate (velocidade_alvo, accel * delta)
	
	_velocidade.x = lvdir.x
	_velocidade.y += gravidade
	
	_velocidade = move_and_slide(_velocidade, Vector2(0, -1))
