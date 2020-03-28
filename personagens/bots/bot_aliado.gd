extends Personagem

export(PackedScene) var arma: PackedScene

var arma_instancia: Node

func _ready() -> void:
	arma_instancia = arma.instance()
	$GunPos.add_child(arma_instancia)
	$MaquinaDeEstados.iniciar(self)


func _physics_process(delta: float):
	$MaquinaDeEstados.executar(delta)


func _ao_detectar_pulo(area):
	pular()
