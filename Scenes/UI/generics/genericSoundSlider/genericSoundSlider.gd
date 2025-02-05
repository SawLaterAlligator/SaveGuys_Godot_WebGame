extends HSlider

@export var busName: String
var busIndex: int


func _ready():
	#busName = busName
	
	busIndex = AudioServer.get_bus_index(busName)
	value = db_to_linear(AudioServer.get_bus_volume_db(busIndex))


@warning_ignore("shadowed_variable_base_class")
func _on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(busIndex, linear_to_db(value))


func _on_drag_ended(_value_changed: bool):
	SignalManager.optionsMusicSliderChanged.emit()


func _on_drag_started():
	SignalManager.optionsMusicSliderChanged.emit()
