extends Camera2D

@export var object_to_follow:Node2D

func _process(delta):
	if object_to_follow:
		position = object_to_follow.position
	
func _physics_process(delta):
	pass