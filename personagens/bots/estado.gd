extends Node
class_name Estado

var personagem: KinematicBody2D

func iniciar(_p: KinematicBody2D) -> void:
	personagem = _p
	

func entrar_estado() -> void:
	pass


func executar(_delta: float) -> String:
	return ""


func sair_estado() -> void:
	pass
