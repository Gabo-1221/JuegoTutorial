extends CanvasLayer

const TILE_HEART = preload("res://kenney/PNG/Default/tile_heart.png")
const UI_NUM_XLARGE = preload("res://kenney/PNG/Default/ui_numXlarge.png")

func _on_game_controller_player_life_update(new_player_life):
	$HBoxContainer/TextureRect.texture = TILE_HEART if new_player_life >= 1 else UI_NUM_XLARGE
	$HBoxContainer/TextureRect2.texture = TILE_HEART if new_player_life >= 2 else UI_NUM_XLARGE
	$HBoxContainer/TextureRect3.texture = TILE_HEART if new_player_life >= 3 else UI_NUM_XLARGE


func _on_game_controller_time_update(second_left):
	$TextureRect/Label.text = str(second_left)
