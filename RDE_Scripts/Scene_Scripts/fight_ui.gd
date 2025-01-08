extends Control

func _ready() -> void:
	GlobalSignal.connect("get_cur_stats", Callable(self, "_on_get_cur_stats"))

func _process(delta: float) -> void:
	pass

func _on_get_cur_stats(type, stats) -> void:
	print(type)
	print(stats)
