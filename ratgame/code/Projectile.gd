extends CharacterBody2D


@export var SPEED = 2000.0
var dir: float
var spawnpos: Vector2
var spawnrot: float
func _ready():
	visible = true
	global_rotation = get_parent().get_node("Player").global_rotation
	global_position = get_parent().get_node("Player").global_position
	velocity = (get_local_mouse_position()/get_local_mouse_position().x*SPEED).rotated(global_rotation)
	await get_tree().create_timer(1).timeout
	queue_free()

func _physics_process(delta):
	move_and_slide()
