extends Estado

export(float) var distancia_minima: float
export(float) var distancia_deteccao_inimigo: float
export(String) var grupo_inimigo: String

var jogador: KinematicBody2D

func iniciar(_p: KinematicBody2D) -> void:
	.iniciar(_p)
	jogador = get_tree().get_nodes_in_group("jogador")[0]


func executar(_delta: float) -> String:
	var pos_j = jogador.global_position
	var pos_p = personagem.global_position
	var dist_jog_per = pos_j.distance_to(pos_p)
	
	if dist_jog_per >= distancia_minima:
		personagem.direcao = Vector2(pos_j.x - pos_p.x,0).normalized()
	else: 
		personagem.direcao = Vector2.ZERO
	
	for inimigo in get_tree().get_nodes_in_group(grupo_inimigo):
		if inimigo.global_position.distance_to(pos_p) <= distancia_deteccao_inimigo:
			return "AtacarInimigo"
	
	return ""
