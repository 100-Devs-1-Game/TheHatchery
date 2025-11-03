extends Control

var deathSFX

func _ready():
	print(Data.set_ending)
	$Welcome.text = "Welcome to the world, baby " + Data.EggName + "..."
	$Welcome.visible_characters = 0
	$RichTextLabel.visible_characters = 0
	if Data.set_ending == "STAGE 0":
		$RichTextLabel.text = STAGE0dialogue
		deathSFX = $Death_1
	if Data.set_ending == "STAGE 1":
		$RichTextLabel.text = STAGE1dialogue
		deathSFX = $Death_2
	if Data.set_ending == "STAGE 2":
		$RichTextLabel.text = STAGE2dialogue
		deathSFX = $Death_3
	if Data.set_ending == "STAGE 3":
		$RichTextLabel.text = STAGE3dialogue
	deathSFX.play()


func _process(delta):
	await get_tree().create_timer(0.5).timeout
	$Welcome.visible_characters += 1
	await get_tree().create_timer(3).timeout
	#deathSFX.play()
	#await get_tree().create_timer(5).timeout
	$RichTextLabel.visible_characters += 1
	if $RichTextLabel.visible_ratio == 1:
		await get_tree().create_timer(1).timeout
		$Button.visible = true

func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/credits.tscn")


var STAGE0 = {
	bgimage = "imagename",
	dialogueblock = STAGE0dialogue
}

var STAGE1 = {
	bgimage = "imagename",
	dialogueblock = STAGE1dialogue
}

var STAGE2 = {
	bgimage = "imagename",
	dialogueblock = STAGE2dialogue
}

var STAGE3 = {
	bgimage = "imagename",
	dialogueblock = STAGE3dialogue
}

var STAGE0dialogue = "    STAGE 0 text line 1
	STAGE 0 text line 2
	STAGE 0 text line 3
	STAGE 0 text line 4
	STAGE 0 text line 5"

var STAGE1dialogue = "    STAGE 1 text line 1
	STAGE 1 text line 2
	STAGE 1 text line 3
	STAGE 1 text line 4
	STAGE 1 text line 5"

var STAGE2dialogue = "    STAGE 2 text line 1
	STAGE 2 text line 2
	STAGE 2 text line 3
	STAGE 2 text line 4
	STAGE 2 text line 5"

var STAGE3dialogue = "    STAGE 3 text line 1
	STAGE 3 text line 2
	STAGE 3 text line 3
	STAGE 3 text line 4
	STAGE 3 text line 5"






#extends Control
#
#var textindex = 0
#
#func _ready():
	#print(Data.set_ending)
	##change bg to ending specific: bgimage.texture = Data.set_ending.bgimage
#
#func _process(delta):
	#null
	##richtext.visibility += 1
	##if richtext.visibility_ratio == 1
		##textindex += 1
#
#func process_ending():
	#null
###NOTE: PROXY PSEUDOCODE
	##textindex = 1
	##textcontainer.visibility = true
	##richtext.text = set_ending[textindex]
	##if richtext.visibility_ratio == 1
		###progress text on click
	###if textindex > event1.size
		###textcontainer.visibility = false
#
#func clickcontinue():
	#null
	##onclick
		##if richtext.visibility_ratio < 1
			##richtext.visibility_ratio = 1
		##else:
			##textindex += 1
			##richtext.visibility = 0
