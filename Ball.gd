extends RigidBody

export(float,1,20) var speed = 5
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _integrate_forces(state):
	var input_h = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var input_v = Input.get_action_strength("ui_down")  - Input.get_action_strength("ui_up")
	var force = Vector3(input_h, 0, input_v)
	add_central_force(force.normalized() * speed) 
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
