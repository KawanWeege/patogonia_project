extends Estado

export(String) var grupo_inimigo: String
export(float) var distancia_maxima: float
export(float) var distancia_strafe: float

var alvo: KinematicBody2D
var strafe_x_alvo: float


func entrar_estado() -> void:
	alvo = pegar_inimigo()
	novo_posicao_strafe()


func executar(_delta: float) -> String:
	var pos_p = personagem.global_position
	alvo = pegar_inimigo()
	
	if not alvo:
		return "SeguirJogador"
	
	var pos_a = alvo.global_position
	personagem.arma_instancia.look_at(pos_a)
	personagem.arma_instancia.atirar()
	
	if abs(strafe_x_alvo - pos_p.x) < 10:
		novo_posicao_strafe()
	else:
		personagem.direcao = Vector2(strafe_x_alvo - pos_p.x, 0).normalized()
	
	if randi() % 100 == 0:
		personagem.pular()
	
	return ""


func pegar_inimigo() -> KinematicBody2D:
	var inimigos = get_tree().get_nodes_in_group(grupo_inimigo)
	var inimigo_mais_perto = inimigos[0]
	var distancia = personagem.global_position.distance_squared_to(inimigo_mais_perto.global_position)
	for inimigo in inimigos.slice(1, inimigos.size()):
		var d = personagem.global_position.distance_squared_to(inimigo.global_position)
		if d < distancia:
			inimigo_mais_perto = inimigo
			distancia = d
			
	return inimigo_mais_perto if sqrt(distancia) <= distancia_maxima else null


func novo_posicao_strafe() -> void:
	strafe_x_alvo = personagem.global_position.x + (randf() * 2 - 1) * distancia_strafe
