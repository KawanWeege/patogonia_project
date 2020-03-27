extends Area2D
class_name Tiro

export(float) var dano: float
export(float) var rapidez: float
export(float) var alcance: float

var velocidade: Vector2
var _distancia_percorrida: float = 0

func _physics_process(delta: float) -> void:
	var deslocamento = velocidade * delta
	position += velocidade * delta
	
	_distancia_percorrida += deslocamento.length()
	if _distancia_percorrida > alcance:
		queue_free()
