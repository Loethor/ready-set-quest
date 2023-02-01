extends VehicleBody


# Declare member variables here. Examples:
export var player_index = 0
var max_torque = 500
var max_rpm = 500

export(PackedScene) var wheat_collector_scene


# Called when the node enters the scene tree for the first time.
func _ready():
	add_wheat_collector()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var acceleration = Input.get_axis("reverse", "accelerate")
	# forced controller acceleration
	if Input.get_connected_joypads().size() > 0:
		var R2_input = Input.get_joy_axis(Input.get_connected_joypads()[0], JOY_ANALOG_R2)
		var L2_input = Input.get_joy_axis(Input.get_connected_joypads()[0], JOY_ANALOG_L2)
		acceleration = R2_input - L2_input
		
		
	var rpm = abs($back_left.get_rpm())
	$back_left.engine_force = acceleration * max_torque * (1 - rpm / max_rpm)
	rpm = abs($back_right.get_rpm())
	$back_right.engine_force = acceleration * max_torque * (1 - rpm / max_rpm)
	# brake when not doing acceleration
	if acceleration == 0:
		$front_left.brake = 5
		$front_right.brake = 5
	else:
		$front_left.brake = 0
		$front_right.brake = 0
		
		
	var new_steer = Input.get_axis("steer_right", "steer_left")
	# forced controller steering
	if Input.get_connected_joypads().size() > 0:
		var steer_axis = Input.get_joy_axis(Input.get_connected_joypads()[0], JOY_ANALOG_LX)
		new_steer = -steer_axis
		
	steering = lerp(steering, new_steer * 0.8, 5 * delta)

func add_wheat_collector():
	var collector = wheat_collector_scene.instance()
	add_child(collector)
	
