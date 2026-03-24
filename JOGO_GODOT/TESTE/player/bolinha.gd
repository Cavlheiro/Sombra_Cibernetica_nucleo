extends KinematicBody
var velocidade = Vector3()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func agua():
	var agua = preload("res://TESTE/player/agua/agua.tscn").instance()
	agua.linear_velocity = -transform.basis.z * 20
	agua.transform.origin = transform.origin
	#agua.transform.origin.y += 1
	agua.linear_velocity.y += 2
	get_parent().add_child(agua)

func _physics_process(delta):
	velocidade.x = lerp(velocidade.x, 0, 0.1)
	velocidade.z = lerp(velocidade.z, 0, 0.1)
	
	velocidade.y -= 8.6 * delta
	
	if Input.is_action_pressed("ui_left"):
		rotate_y(2 * delta)
		
	if Input.is_action_pressed("ui_right"):
		rotate_y(-2 * delta)
		
	if Input.is_action_pressed("ui_up"):
		var frente = -transform.basis.z
		velocidade.x += frente.x * 50 * delta
		velocidade.z += frente.z * 50 * delta
		
	if Input.is_action_pressed("ui_down"):
		var frente = transform.basis.z
		velocidade.x += frente.x * 50 * delta
		velocidade.z += frente.z * 50 * delta
	if Input.is_action_just_pressed("ui_select"):
		agua()
	
	
		#velocidade.x -= 50 * delta

	velocidade = move_and_slide(velocidade, Vector3.UP)

