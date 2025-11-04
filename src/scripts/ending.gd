extends Control

var deathSFX : AudioStreamPlayer

var textstart1 = false
var textstart2 = false

func _ready():
	print(Data.set_ending)
	$Welcome.text = "Welcome to the world, baby " + Data.EggName + "..."
	$Welcome.visible_characters = 0
	$RichTextLabel.visible_characters = 0
	if Data.set_ending == "STAGE 0":
		$RichTextLabel.text = STAGE0dialogue
		deathSFX = $Death_1
		#$Death_1.play()
	if Data.set_ending == "STAGE 1":
		$RichTextLabel.text = STAGE1dialogue
		deathSFX = $Death_2
		#$Death_2.play()
	if Data.set_ending == "STAGE 2":
		$RichTextLabel.text = STAGE2dialogue
		deathSFX = $Death_3
		#$Death_3.play()
	if Data.set_ending == "STAGE 3":
		$RichTextLabel.text = STAGE3dialogue
	$Death_1.play()
	#deathSFX.play()
	await get_tree().create_timer(0.5).timeout
	textstart1 = true
	await get_tree().create_timer(3).timeout
	textstart2 = true


func _process(delta):
	if textstart1 == true:
		$Welcome.visible_characters += 1
	if textstart2 == true:
		$RichTextLabel.visible_characters += 1
	if $RichTextLabel.visible_ratio == 1:
		await get_tree().create_timer(1).timeout
		$Button.visible = true

func _on_button_pressed():
	print("press")
	$ColorRect.visible = true
	$AnimationPlayer.play("fade_to_black")
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://scenes/credits.tscn")



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
