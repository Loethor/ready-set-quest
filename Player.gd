extends Node


export onready var wheat_counter = 0

func _ready() -> void:
	SignalBus.connect("wheat_collected", self, "_on_wheat_collected")

func _process(delta: float) -> void:
	pass

func _on_wheat_collected():
	wheat_counter += 1
	print(wheat_counter)
