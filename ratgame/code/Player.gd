extends CharacterBody2D

@onready var projectile = preload("res://Projectile.tscn")
const SPEED = 300.0
var can_shoot = true

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func get_input():
	#var input_direction = Input.get_axis("Left", "Right", "Up", "Down")
	velocity = Input.get_vector("Left","Right","Up","Down") * SPEED
	look_at(get_global_mouse_position())
func shoot():
	if Input.is_action_just_pressed("Shoot") and can_shoot == true:
		var instance = projectile.instantiate()
		get_parent().add_child(instance)
		instance.visible = true
		can_shoot = false
		await get_tree().create_timer(1.0/2.5).timeout
		can_shoot = true
func _physics_process(delta):
	shoot()
	get_input()
	move_and_slide()
	

	move_and_slide()
# Replace with function body.
