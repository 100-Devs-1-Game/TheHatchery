extends Control

signal activate_dialog(idx: int)
signal dialog_accepted
signal dialog_denied

@onready var yes_button: Button = $Panel/MarginContainer/VBoxContainer/HBoxContainer/YES
@onready var no_button: Button = $Panel/MarginContainer/VBoxContainer/HBoxContainer/NO
@onready var text: RichTextLabel = $Panel/MarginContainer/VBoxContainer/RichTextLabel

#Connects activate dialog (called only from outside) to display text
#Connects buttons to respective dialog output signals (called only from inside) and disable buttons
func _ready() -> void:
	activate_dialog.connect(display_text)
	no_button.button_down.connect(func():
		yes_button.disabled = true
		no_button.disabled = true
		dialog_denied.emit()
	)
	yes_button.button_down.connect(func():
		yes_button.disabled = true
		no_button.disabled = true
		dialog_accepted.emit()
	)


func display_text(index: int):
	show()
	#grab the string from Data and set label text to fetched string
	var fetched = Data.DIALOGS.get(index)
	if fetched:
		text.text = fetched
