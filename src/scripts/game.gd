extends Control



@onready var click_counter: Label = $ClickCounter
@onready var darkness: ColorRect = $Darkness
@onready var dialog: Control = $Dialog

var clicks = 0

func _ready():
	$Darkness.visible = true


func _process(_delta):
	# NOTE: DISPLAYS CURRENT CLICK VALUE
	#$Label.text = "%d clicks" % int(clicks)
	if clicks == 1:
		click_counter.text = str(clicks) + " click"
	else:
		click_counter.text = str(clicks) + " clicks"
	
	#richtext.visibility += 1


func _on_lightswitch_pressed():
	darkness.visible = !darkness.visible


func _on_click_target_pressed():
	Data.clicks += Data.clickvalue
	clicks = Data.clicks
	print(Data.clicks)
	print("you clicked " + str(clicks) + " time/s")
	
	# NOTE: CLICK VALUE-BASED EVENT TEMPLATE
	if Data.DIALOGS.keys().has(clicks):
		dialog.activate_dialog.emit(clicks)
	
	if Data.clicks == Data.due_date:
		Data.hatch()




func _on_research_notes_pressed():
	if Data.tutorialview == false:
		Data.tutorialview = true
		var tween = create_tween()
		tween.tween_property($ResearchNotesProp, "position", Vector2 (527,40), 1).set_trans(Tween.TRANS_EXPO)
	else:
		Data.tutorialview = false
		var tween = create_tween()
		tween.tween_property($ResearchNotesProp, "position", Vector2 (527,1100), 1).set_trans(Tween.TRANS_EXPO)
