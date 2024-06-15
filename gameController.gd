extends Node2D

const SCENE_FINISH_FILE = "res://escena_final.tscn"

signal player_life_update(new_player_life)
signal time_update(second_left)
@export var player_life = 3
@export var time_second = 10

func game_over():
	get_tree().change_scene_to_file(SCENE_FINISH_FILE)
	
func game_win():
	var scene_finish_instence = preload(SCENE_FINISH_FILE).instantiate()
	scene_finish_instence.set_title("HAS GANADO")
	add_child(scene_finish_instence)

func _on_personaje_player_hit():
	print("Se detectado que has recibido daño al personaje x")
	if player_life > 0:
		player_life = player_life - 1
		player_life_update.emit(player_life)
	else:
		game_over()

func _on_area_2d_body_entered(body):
	game_win()


func _on_timer_timeout():
	if time_second > 0:
		time_second = time_second - 1
	if time_second <= 0:
		game_over()
	time_update.emit(time_second)
