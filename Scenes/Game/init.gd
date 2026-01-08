extends Control
@onready var tabs = $Screen/Left/Rows/Tabs
func read_json_file(file_path: StringName) -> Variant:
	var file: FileAccess = FileAccess.open(file_path, FileAccess.READ)
	if file == null:
		print("Failed to open file: ", file_path)
		print("Error: ", FileAccess.get_open_error())
		return null
	var content: String = file.get_as_text()
	file.close()
	var json_content = JSON.parse_string(content)
	if json_content == null:
		print("Failed to parse JSON from file: ", file_path)
		return null
	return json_content
func _ready() -> void:
	for f in ["flora", "fauna"]:
		var vbox = VBoxContainer.new()
		vbox.name = f.capitalize()
		tabs.add_child(vbox)
		for i in read_json_file("Data/data.json")[f]:
			var title = RichTextLabel.new()
			title.autowrap_mode = TextServer.AUTOWRAP_OFF
			title.size_flags_vertical = Control.SIZE_EXPAND_FILL
			title.size_flags_stretch_ratio = 0.2
			title.parse_bbcode("[font_size=50]%s" % i.name)
			vbox.add_child(title)
			var desc = RichTextLabel.new()
			desc.autowrap_mode = TextServer.AUTOWRAP_OFF
			desc.size_flags_vertical = Control.SIZE_EXPAND_FILL
			desc.parse_bbcode("[font_size=30]%s" % i.desc)
			desc.anchor_top = ANCHOR_BEGIN
			vbox.add_child(desc)
			var button = Button.new()
			button.text = "Buy"
			vbox.add_child(button)
func _process(_delta: float) -> void:
	pass
