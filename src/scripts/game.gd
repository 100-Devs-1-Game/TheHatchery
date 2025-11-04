extends Control



@onready var click_counter: Label = $ClickCounter
@onready var darkness: TextureRect = $Darkness
@onready var dialog: Control = $Dialog
@onready var eggname_panel: Panel = $Eggname
#@onready var animplayer : AnimationPlayer = $AnimationPlayer
#@onready var rustling : AudioStreamPlayer = $Rustling


var clicks = 0

var hatchSFX

func _ready():
	darkness.visible = true
	$Black.visible = false
	Data.animplayer = $AnimationPlayer
	Data.rustling = $Rustling
	Data.environment = $Environment
	Data.black = $Black
	Data.lightswitch = $LightSwitch
	$MP3Button.disabled = true


func _process(_delta):
	# NOTE: DISPLAYS CURRENT CLICK VALUE
	#$Label.text = "%d clicks" % int(clicks)
	if clicks == 1:
		click_counter.text = str(clicks) + " click"
	else:
		click_counter.text = str(clicks) + " clicks"
	
	if Data.current_stage == "STAGE 0":
		$Environment.play("STAGE0")
		if $ClickTarget.button_pressed == true:
			$Egg.play("wiggle0")
			await get_tree().create_timer(1).timeout
		else:
			$Egg.play("still0")
		$Darkness.texture = load("res://assets/images/STAGE01dark.png")
	
	if Data.current_stage == "STAGE 1":
		$Environment.play("STAGE1")
		if $ClickTarget.button_pressed == true:
			$Egg.play("wiggle1")
			await get_tree().create_timer(1).timeout
		else:
			$Egg.play("still1")
		$Darkness.texture = load("res://assets/images/STAGE01dark.png")
	
	if Data.current_stage == "STAGE 2":
		$Environment.play("STAGE2")
		if $ClickTarget.button_pressed == true:
			$Egg.play("wiggle1")
			await get_tree().create_timer(1).timeout
		else:
			$Egg.play("still1")
		$Darkness.texture = load("res://assets/images/STAGE2dark.png")
		$MP3Button.disabled = false
	
	if Data.current_stage == "STAGE 3":
		$Environment.play("STAGE3")
		if $ClickTarget.button_pressed == true:
			$Egg.play("wiggle1")
			await get_tree().create_timer(1).timeout
		else:
			$Egg.play("still1")
		$Darkness.texture = load("res://assets/images/STAGE3dark.png")
	
	if $"C&C".playing == true:
		$Node2D.visible = true
	else:
		$Node2D.visible = false

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
	
	if Data.current_stage == "STAGE 0":
		$Egg.play("wiggle0")
	else:
		$Egg.play("wiggle1")
	
		if clicks == Data.TIMEVALUES.due_40weeks + 48:
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





#func darkness_transition_pt1():
	#$Darkness.modulate = Color(0, 0, 100, 0)
	#$Darkness.visible = true
	#$AnimationPlayer.play("fade_to_dark")
	#$Rustling.play()
#
#func darkness_transition_pt2():
	#await get_tree().create_timer(3).timeout
	#$AnimationPlayer.play("fade_from_dark")




func hatch():
	if clicks == Data.TIMEVALUES.due_2weeks + 48:
		Data.set_ending = "STAGE 0"
		hatchSFX = $ExternalCrack
	if clicks == Data.TIMEVALUES.due_8weeks + 48:
		Data.set_ending = "STAGE 1"
		hatchSFX = $ExternalCrack
	if clicks == Data.TIMEVALUES.due_24weeks + 48:
		Data.set_ending = "STAGE 2"
		hatchSFX = $InternalCrack
	if clicks == Data.TIMEVALUES.due_40weeks + 48:
		Data.set_ending = "STAGE 3"
		hatchSFX = $InternalCrack
	$Black.visible = true
	$AnimationPlayer.play("fade_to_black")
	hatchSFX.play()
	await get_tree().create_timer(6).timeout
	get_tree().change_scene_to_file("res://scenes/ending.tscn")


func _on_mp_3_button_pressed():
	$"C&C".playing = !$"C&C".playing
