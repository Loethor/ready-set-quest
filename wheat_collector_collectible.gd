extends Spatial

export (PackedScene) var wheat_collect_scene

func _on_Area_body_entered(body: Node) -> void:
	print(body)
	if body.name == "test_car_with_wheels":
		$wheat_collector_collectible.hide()
		$Area/CollisionShape.disabled = true
		var collector = wheat_collect_scene.instance()
		SignalBus.emit_signal("wheat_collector_collectible_picked", collector)
		$CollectibleTimer.start()

func _on_CollectibleTimer_timeout() -> void:
	$wheat_collector_collectible.show()
	$Area/CollisionShape.disabled = false
