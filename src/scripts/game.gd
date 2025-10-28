extends Control

@onready var clickvalue = Data.clickvalue

@onready var eggclickable = Data.eggclickable
@onready var clicks = Data.clicks
@onready var tutorialview = Data.tutorialview

@onready var event1 = Data.array_eventtemplatetext


#func _ready():
	#dark = true


func _process(_delta):
	# NOTE: DISPLAYS CURRENT CLICK VALUE
	#$Label.text = "%d clicks" % int(clicks)
	if clicks == 1:
		$ClickCounter.text = str(clicks) + " click"
	else:
		$ClickCounter.text = str(clicks) + " clicks"
	
	#richtext.visibility += 1


func _on_lightswitch_pressed():
	# NOTE (Galesy): Commented out for a better solution, do lmk if this needs reverting
	#if $Darkness.visible == true:
		#$Darkness.visible = false
	#else:
		##intended as a reset, refer to line 33 on fail
		##get_tree().quit() NOTE (Galesy): Is this supposed to be here? This will close the game, commenting till i ask abt this 
		##manual resetting on lightswitch
		#$Darkness.visible = true
		##reset click count
	$Darkness.visible = !$Darkness.visible


func _on_click_target_pressed():
	clicks += clickvalue
	print("you clicked " + str(clicks) + " time/s")
	
	# NOTE: CLICK VALUE-BASED EVENT TEMPLATE
	if clicks == 100:
		print("you reached 100")
		event_template(event1)


func event_template(event1):
	print("event 1 triggered")
	#NOTE: PROXY PSEUDOCODE
	#eggclickable = false
	#textindex = 1
	#textcontainer.visibility = true
	#richtext.text = event1[textindex]
	#if richtext.visibility_ratio == 1
		#progress text on click
	#if textindex > event1.size
		#textcontainer.visibility = false
	#eggclickable = true
	
	#TODO:
	# MAKE TEMPLATE FOR TEXT SECTIONS
	## NEEDS TO BE ABLE TO;
	### DISPLAY TEXT FROM THE MATCHING ARRAY/DICTIONARY IN DATA SCRIPT
	### DISPLAY AND ACT BASED ON 'YES/NO' CHOICE OPTIONS
	#### ON A 'NO' THE GAME WILL END AND THE EGG WILL 'HATCH' ON THE DATE/TIME GIVEN IN DATA (TBD)
	#### ON A 'YES' THE GAME'S END AND 'HATCH' DATE/TIME WILL EXTEND
	### DISPLAY A NEW OBJECT IN THE INCUBATOR IF 'YES' IS CHOSEN


func _on_research_notes_pressed():
	if tutorialview == false:
		tutorialview = true
		var tween = create_tween()
		tween.tween_property($ResearchNotesProp, "position", Vector2 (527,40), 1).set_trans(Tween.TRANS_EXPO)
	else:
		tutorialview = false
		var tween = create_tween()
		tween.tween_property($ResearchNotesProp, "position", Vector2 (527,1100), 1).set_trans(Tween.TRANS_EXPO)
