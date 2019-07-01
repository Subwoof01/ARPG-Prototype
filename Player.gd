extends KinematicBody2D

const ACCELERATION = 25
const MAX_SPEED = 200

var speed = 0

var lmb_pressed = false

onready var game = get_node("/root/Game")
onready var camera = $Camera2D
onready var nav_map = get_parent()
onready var animation = $AnimatedSprite

func _physics_process(delta):
	if lmb_pressed:
		if speed < MAX_SPEED:
			speed += ACCELERATION
		var velocity = speed
		
		var direction = (camera.get_global_mouse_position() - position).normalized()
		
		set_sprite_direction()
		move_and_collide(direction * speed * delta)
		
	
func set_sprite_direction():
	var angle = get_angle_to(mouse_position())
	var angle_string = str(round(angle))
	
	print(angle)
	
	if angle < -0.75 and angle > -2.25:
		animation.animation = "Walking"
		animation.frame = 2
	if angle < -2.25 and angle > -2.85:
		animation.animation = "Walking"
		animation.frame = 1
	if angle < -2.85 and angle > -3.15:
		animation.animation = "Walking"
		animation.frame = 0
	if angle < 3.15 and angle > 2.85:
		animation.animation = "Walking"
		animation.frame = 0
	if angle < 2.85 and angle > 2.25:
		animation.animation = "Walking"
		animation.frame = 7
	if angle < 2.25 and angle > 0.75:
		animation.animation = "Walking"
		animation.frame = 6
	if angle < 0.75 and angle > 0.25:
		animation.animation = "Walking"
		animation.frame = 5
	if angle < 0.25 and angle > 0:
		animation.animation = "Walking"
		animation.frame = 4
	if angle < 0 and angle > -0.25:
		animation.animation = "Walking"
		animation.frame = 4
	if angle < -0.25 and angle > -0.85:
		animation.animation = "Walking"
		animation.frame = 3
	
func mouse_position():
	var m_pos = game.get_global_mouse_position()
	return m_pos
	
func handle_inputs():
	if Input.is_action_pressed("ui_left_mouse_button"):
		lmb_pressed = true
	if Input.is_action_just_released("ui_left_mouse_button"):
		lmb_pressed = false
		speed = 0
		