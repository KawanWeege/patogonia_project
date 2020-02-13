extends Node2D

export(PackedScene) var tiro_cena: PackedScene
export(bool) var automatico: bool

onready var posicao_tiro: Position2D = $ShootPos
onready var timer_tiro: Timer = $ShotDelay
onready var conteiner_tiro: Node = $Tiros


func _physics_process(_delta: float):
	look_at(get_global_mouse_position())
	
	if automatico && Input.is_action_pressed("atirar") || !automatico && Input.is_action_just_pressed("atirar"):
		atirar()


func atirar() -> void:
	if !timer_tiro.is_stopped():
		return
	
	timer_tiro.start()
	
	var tiro: Tiro = tiro_cena.instance()
	conteiner_tiro.add_child(tiro)
	tiro.translate(posicao_tiro.global_position)
	tiro.rotate(posicao_tiro.global_rotation)
	tiro.velocidade = Vector2(tiro.rapidez, 0).rotated(posicao_tiro.global_rotation)
