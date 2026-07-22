extends Area3D

@export var speed: float = 10.0
var velocity: Vector3 = Vector3.ZERO

func _ready() -> void:
	on_activate()
	#on_activate is used so that we can later keep an array of pre-instantiated
	#cars in memory and reuse them as they are deactivated

func _process(delta: float) -> void:
	position += velocity * delta
	pass

func on_activate() -> void:
	velocity = transform.basis.x * speed
	visible = true
	await get_tree().create_timer(4).timeout
	velocity = Vector3.ZERO
	#visible = false	#disabled for debug purposes
