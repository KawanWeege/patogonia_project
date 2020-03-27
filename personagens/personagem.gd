extends KinematicBody2D
class_name Personagem

export(float) var gravidade: float
export(float) var velocidade_maxima: float
export(float) var aceleracao: float
export(float) var forca_pulo: float

var _velocidade: Vector2
var direcao: Vector2


func _physics_process(delta: float):
	processar_movimento(delta)


func pular() -> void:
	if is_on_floor():
		_velocidade.y -= forca_pulo


func processar_movimento(delta: float) -> void:
	# Pegar a velocidade, e descartar o y. 
	# Vamos primeiro calcular a velocidade horizontal e dps adicionar gravidade
	var lvdir = _velocidade
	lvdir.y = 0
	
	var velocidade_alvo = direcao.normalized() * velocidade_maxima
	var accel = -aceleracao
	
	if(lvdir.dot(_velocidade) > 0):
		accel = aceleracao
	
	lvdir = lvdir.linear_interpolate (velocidade_alvo, accel * delta)
	
	# Aplicar velocidade
	_velocidade.x = lvdir.x
	_velocidade.y += gravidade
	
	_velocidade = move_and_slide(_velocidade, Vector2(0, -1))
