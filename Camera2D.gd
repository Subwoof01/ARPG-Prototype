extends Camera2D

onready var player = get_parent()

func _process(delta):
	position = player.position