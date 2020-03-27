extends Personagem

export(PackedScene) var arma: PackedScene
export(bool) var automatico: bool

func _ready():
	$GunPos.add_child(arma.instance())


func _physics_process(delta: float) -> void:
	# Pegar os inputs do jogador
	direcao = Vector2.ZERO
	
	if Input.is_action_pressed("andar_para_direita"):
		direcao.x += 1
	if Input.is_action_pressed("andar_para_esquerda"):
		direcao.x -= 1
	
	if Input.is_action_pressed("pular"):
		pular()
	
	
	$GunPos.get_child(0).look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("atirar") and automatico or Input.is_action_just_pressed("atirar") and not automatico:
		$GunPos.get_child(0).atirar()
