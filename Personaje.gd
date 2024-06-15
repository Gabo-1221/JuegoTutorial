class_name Personaje
extends CharacterBody2D

signal  player_hit()

@export var gravedad = 100
@export var jump_speed  = 100
@export var speed  = 100
@onready var character_round_yellow = $CharacterRoundYellow

func  _physics_process(delta):
	#horizontal
	var dirreccion = Input.get_axis("izquierda","derecha")
	velocity.x = speed * dirreccion
	
	if dirreccion != 0:
		$CharacterRoundYellow.scale.x = dirreccion
	
	
	#gravedad
	if not is_on_floor():
		velocity.y = velocity.y + gravedad * delta
		
	#saltar
	var jump_pressed = Input.is_action_just_pressed("saltar")
	if jump_pressed and is_on_floor(): 
		velocity.y = velocity.y - jump_speed
	
	move_and_slide()


func _on_area_2d_body_entered(body):
	print("un cuerpo a entrado en el Area -> ",body.name) # Replace with function body.

func damage_received():
	print("Daño recibido")
	player_hit.emit()
