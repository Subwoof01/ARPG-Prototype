extends Node2D

onready var player = $NavigationMap/Player

func _unhandled_input(event):
	player.handle_inputs()