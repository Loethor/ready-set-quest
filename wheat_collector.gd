extends Spatial

func _ready() -> void:
	var car = self.get_parent()
	$AnimationPlayer.play("rotation")
