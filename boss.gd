class_name Boss
extends Node2D

@onready var animation_player = $AnimationPlayer
const ESC_RUEDA = preload("res://rueda.tscn")

func _ready():
	$Timer.connect("timeout", _on_timer_timeout)

func launch_barrel():
	var instancia_barril = ESC_RUEDA.instantiate()
	instancia_barril.position = $CharacterSquarePurple/CharacterHandPurple.position
	add_child(instancia_barril)
	animation_player.play("reposo")


func _on_timer_timeout():
	animation_player.play("lanzar2")
	$Timer.wait_time = randf_range(4,7)
