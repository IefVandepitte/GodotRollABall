extends RigidBody

export(float,1,20) var speed = 5
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _input(event):	
	var force = Vector3(0,0,0)
	if event is InputEventKey and event.pressed :
			if event.scancode == KEY_SPACE:
				force = Vector3(0, 500, 0)
	elif event is InputEventScreenTouch :
		print("touched")
		force = Vector3(0, 500, 0)
	apply_central_impulse(force.normalized() * speed)

func _process(delta):
	var acc = Input.get_accelerometer()
	var grav = Input.get_gravity()
	var mag = Input.get_magnetometer()
	var gyro = Input.get_gyroscope()
	
				

func _integrate_forces(state):
	var input_h = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var input_v = Input.get_action_strength("ui_down")  - Input.get_action_strength("ui_up")
	var force = Vector3(input_h, 0, input_v)
#	print(force.normalized() * speed)
	add_central_force(force.normalized() * speed) 
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
