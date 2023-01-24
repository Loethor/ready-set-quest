extends VehicleBody


# Declare member variables here. Examples:
var max_torque = 500
var max_rpm = 1500


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
    var acceleration = Input.get_axis("reverse", "accelerate")
        
    var rpm = abs($back_left.get_rpm())
    $back_left.engine_force = acceleration * max_torque * (1 - rpm / max_rpm)
    rpm = abs($back_right.get_rpm())
    $back_right.engine_force = acceleration * max_torque * (1 - rpm / max_rpm)

    if Input.is_action_pressed("brake"):
        $front_left.brake = 5
        $front_right.brake = 5
    else:
        $front_left.brake = 0
        $front_right.brake = 0
        
    steering = lerp(steering, Input.get_axis("steer_right", "steer_left") * 0.7, 5 * delta)
