extends Spatial


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var car = self.get_parent()
	print(car)
	$AnimationPlayer.play("rotation")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
