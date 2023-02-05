extends Spatial


func _on_Area_body_entered(body: Node) -> void:
	print(body)
	if body.name == "wheat_collector_body":
		$Wheat.hide()
		$Area/CollisionShape.disabled = true
		SignalBus.emit_signal("wheat_collected")
		$WheatTimer.start()

func _on_WheatTimer_timeout() -> void:
	$Wheat.show()
	$Area/CollisionShape.disabled = false
