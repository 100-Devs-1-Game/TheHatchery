extends Node

var clickvalue : int = 1

var current_stage = "STAGE 0"

var eggclickable : bool = true
var clicks : int = 0
var event1passed : bool = false
var textindex : int = 1

var tutorialview : bool = false

var checkpoint1
var checkpoint2
var checkpoint3

var due_date
var set_ending

var EggName = ""

var black
var animplayer
var rustling
var environment

#NOTE: CURRENT VALUES ALIGN TO 1 HOUR PER CLICK (MAY BE REPLACED)
enum TIMEVALUES {
	#test = 10,
	due_2weeks = 3,#336
	due_8weeks = 1344,
	due_24weeks = 4032,
	due_40weeks = 6720,
}

func set_due_date():
	if clicks == TIMEVALUES.due_2weeks:
		print("due any day now (2 weeks plus 2 days)")
		due_date = TIMEVALUES.due_2weeks + 48
	if clicks == TIMEVALUES.due_8weeks:
		print("due any day now (8 weeks plus 2 days)")
		due_date = TIMEVALUES.due_8weeks + 48
	if clicks == TIMEVALUES.due_24weeks:
		print("due any day now (24 weeks plus 2 days)")
		due_date = TIMEVALUES.due_24weeks + 48


func darkness_transition_pt1():
	black.modulate = Color(0, 0, 100, 0)
	black.visible = true
	animplayer.play("fade_to_black")
	rustling.play()
	await get_tree().create_timer(3).timeout

func darkness_transition_pt2():
	animplayer.play("fade_from_black")
	await get_tree().create_timer(3).timeout
	black.visible = false


func add_stimuli():
	if clicks == TIMEVALUES.due_2weeks:
		print("added a blanket to the hatchery")
		darkness_transition_pt1()
		environment.texture = load("res://assets/PROXYimage/WIP1blanket.png") #to replace
		darkness_transition_pt2()
	if clicks == TIMEVALUES.due_8weeks:
		print("added an mp3 player to the hatchery")
		darkness_transition_pt1()
		environment.texture = load("res://assets/PROXYimage/WIP2MPplayer.png") #to replace
		#mp3playerbutton.disabled = false
		darkness_transition_pt2()
	if clicks == TIMEVALUES.due_24weeks:
		print("added some plushies to the hatchery")
		darkness_transition_pt1()
		environment.texture = load("res://assets/PROXYimage/WIP3plushies.png") #to replace
		#boopbutton.disabled = false
		darkness_transition_pt2()


#func hatch():
	#if clicks == TIMEVALUES.due_2weeks + 48:
		#set_ending = "STAGE 0"
	#if clicks == TIMEVALUES.due_2weeks + 48:
		#set_ending = "STAGE 1"
	#if clicks == TIMEVALUES.due_2weeks + 48:
		#set_ending = "STAGE 2"
	#if clicks == TIMEVALUES.due_2weeks + 48:
		#set_ending = "STAGE 3"
	#animplayer.play("fade_to_black")
	#get_tree().change_scene_to_file("res://scenes/ending.tscn")

var DIALOGS: Dictionary[int, String] = {
	#TIMEVALUES.test: "TEST DIALOGUE\n This is some text\n It'll be output on the dialog panel\n Might make automated tool to add these faster",
	TIMEVALUES.due_2weeks: "TEST: Stage 0 hatch day",
	TIMEVALUES.due_8weeks: "TEST: Stage 1 hatch day",
	TIMEVALUES.due_24weeks: "TEST: Stage 2 hatch day",
	TIMEVALUES.due_40weeks: "TEST: Stage 3 hatch day"
}
