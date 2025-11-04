extends Control



@onready var click_counter: Label = $ClickCounter
@onready var darkness: TextureRect = $Darkness
@onready var dialog: Control = $Dialog
@onready var eggname_panel: Panel = $Eggname
#@onready var animplayer : AnimationPlayer = $AnimationPlayer
#@onready var rustling : AudioStreamPlayer = $Rustling


var clicks = 0

func _ready():
	darkness.visible = true
	$Black.visible = false
	Data.animplayer = $AnimationPlayer
	Data.rustling = $Rustling
	Data.environment = $Environment
	Data.black = $Black


func _process(_delta):
	# NOTE: DISPLAYS CURRENT CLICK VALUE
	#$Label.text = "%d clicks" % int(clicks)
	if clicks == 1:
		click_counter.text = str(clicks) + " click"
	else:
		click_counter.text = str(clicks) + " clicks"
	
	#richtext.visibility += 1


func _on_lightswitch_pressed():
	$LightSwitch.play()
	
	darkness.visible = !darkness.visible
	if !darkness.visible and Data.EggName == "":
		eggname_panel.show()


func _on_click_target_pressed():
	$EggTap.play()
	
	Data.clicks += Data.clickvalue
	clicks = Data.clicks
	#print("you clicked " + str(clicks) + " time/s")
	
	# NOTE: CLICK VALUE-BASED EVENT TEMPLATE
	if Data.DIALOGS.keys().has(clicks):
		dialog.activate_dialog.emit(clicks)
	
	if Data.clicks == Data.due_date:
		hatch()




func _on_research_notes_pressed():
	$PaperSwish.play()
	
	if Data.tutorialview == false:
		Data.tutorialview = true
		var tween = create_tween()
		tween.tween_property($ResearchNotesProp, "position", Vector2 (527,40), 1).set_trans(Tween.TRANS_EXPO)
	else:
		Data.tutorialview = false
		var tween = create_tween()
		tween.tween_property($ResearchNotesProp, "position", Vector2 (527,1100), 1).set_trans(Tween.TRANS_EXPO)


func _on_egg_name_text_submitted(new_text: String) -> void:
	Data.EggName = new_text
	eggname_panel.hide()





func darkness_transition_pt1():
	$Darkness.modulate = Color(0, 0, 100, 0)
	$Darkness.visible = true
	$AnimationPlayer.play("fade_to_dark")
	$Rustling.play()

func darkness_transition_pt2():
	await get_tree().create_timer(3).timeout
	$AnimationPlayer.play("fade_from_dark")


#func add_stimuli():
	#if clicks == Data.TIMEVALUES.due_2weeks:
		#print("added a blanket to the hatchery")
		#darkness_transition_pt1()
		#$Darkness.texture = ("res://assets/PROXYimage/WIPhatcheryscene3d.png")
		#darkness_transition_pt2()
	#if clicks == Data.TIMEVALUES.due_8weeks:
		#print("added an mp3 player to the hatchery")
		#darkness_transition_pt1()
		#$Darkness.texture = ("res://assets/PROXYimage/WIPhatcheryscene3d.png")
		##mp3playerbutton.disabled = false
		#darkness_transition_pt2()
	#if clicks == Data.TIMEVALUES.due_24weeks:
		#print("added some plushies to the hatchery")
		#darkness_transition_pt1()
		#$Darkness.texture = ("res://assets/PROXYimage/WIPhatcheryscene3d.png")
		##boopbutton.disabled = false
		#darkness_transition_pt2()


func hatch():
	if clicks == Data.TIMEVALUES.due_2weeks + 48:
		Data.set_ending = "STAGE 0"
	if clicks == Data.TIMEVALUES.due_2weeks + 48:
		Data.set_ending = "STAGE 1"
	if clicks == Data.TIMEVALUES.due_2weeks + 48:
		Data.set_ending = "STAGE 2"
	if clicks == Data.TIMEVALUES.due_2weeks + 48:
		Data.set_ending = "STAGE 3"
	$AnimationPlayer.play("fade_to_black")
	get_tree().change_scene_to_file("res://scenes/ending.tscn")
