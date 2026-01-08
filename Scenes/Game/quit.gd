extends Button
func _ready() -> void:
	pass
func _process(_delta: float) -> void:
	pass
func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Main/Main.tscn")
