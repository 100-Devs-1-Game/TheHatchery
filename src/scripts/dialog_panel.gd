extends Control

signal activate_dialog(idx: int)
signal dialog_accepted
signal dialog_denied

@onready var yes_button: Button = $Panel/MarginContainer/VBoxContainer/HBoxContainer/YES
@onready var no_button: Button = $Panel/MarginContainer/VBoxContainer/HBoxContainer/NO
@onready var text: RichTextLabel = $Panel/MarginContainer/VBoxContainer/RichTextLabel

#Connects activate dialog (called only from outside) to display text
#Connects buttons to respective dialog output signals (called only from inside) and disable buttons

const LETTER_DELAY = 0.05
var line_complete: bool = false
var target_text: PackedStringArray

func _ready() -> void:
	activate_dialog.connect(display_text)
	no_button.button_down.connect(func():
		yes_button.disabled = true
		no_button.disabled = true
		dialog_denied.emit()
		Data.set_due_date()
	)
	yes_button.button_down.connect(func():
		yes_button.disabled = true
		no_button.disabled = true
		dialog_accepted.emit()
		Data.add_stimuli()
	)


func display_text(index: int):
	show()
	#grab the string from Data and set label text to fetched string
	var string: String = Data.DIALOGS.get(index)
	if string:
		target_text = string.split("\n ")

var letter_delta: float = 0.0
var str_index: int = 0
func _process(delta: float) -> void:
	if target_text.is_empty():
		if text.text: text.text = ""
		return
	letter_delta += delta
	if letter_delta > LETTER_DELAY and !line_complete:
		text.text += target_text[0][str_index]
		if str_index == target_text[0].length() - 1: line_complete = true
		str_index += 1
		letter_delta = 0.0
	
	elif line_complete:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			text.text = ""
			target_text.remove_at(0)
			line_complete = false
			str_index = 0
			letter_delta = 0
