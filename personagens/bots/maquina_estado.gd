extends Node


export(String) var estado_atual = ""

var estados: Dictionary = {}
var personagem: KinematicBody2D
var iniciado: bool = false

func iniciar(_p: KinematicBody2D) -> void:
	personagem = _p
	
	for estado in get_children():
		estados[estado.name] = estado
		estado.iniciar(personagem)
	
	iniciado = true
	
	mudar_de_estado(estado_atual)


func executar(delta: float) -> void:
	if estados.size() == 0:
		return
	
	if not iniciado:
		print("Maquina de estados não iniciado!")
		return
	
	var valor_retornado: String = estados[estado_atual].executar(delta)
	if valor_retornado != "":
		mudar_de_estado(valor_retornado)


func mudar_de_estado(estado: String):
	if estado_atual != "":
		estados[estado_atual].sair_estado()
	
	estado_atual = estado
	estados[estado_atual].entrar_estado()
