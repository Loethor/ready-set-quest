extends Spatial

func _ready() -> void:
	pass # Replace with function body.


func _on_Area_body_entered(body: Node) -> void:
	print(body)
	if body.name == "wheat_collector_body":
		$Wheat.hide()
		$Area/CollisionShape.disabled = true
		body.get_parent().get_parent().get_parent().get_node("Player").wheat_counter += 1
		$WheatTimer.start()

func _on_WheatTimer_timeout() -> void:
	$Wheat.show()
	$Area/CollisionShape.disabled = false
