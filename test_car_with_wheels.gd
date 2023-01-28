extends VehicleBody


# Declare member variables here. Examples:
var max_torque = 1500
var max_rpm = 500


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
    var acceleration = Input.get_axis("reverse", "accelerate")
        
    var rpm = abs($front_left.get_rpm())
    $front_left.engine_force = acceleration * max_torque * (1 - rpm / max_rpm)
    rpm = abs($front_right.get_rpm())
    $front_right.engine_force = acceleration * max_torque * (1 - rpm / max_rpm)
    
    if acceleration == 0:
        $front_left.brake = 5
        $front_right.brake = 5
        
        
    steering = lerp(steering, Input.get_axis("steer_right", "steer_left") * 0.8, 15 * delta)
