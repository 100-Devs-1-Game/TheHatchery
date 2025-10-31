extends Node

var clickvalue : int = 1

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


#NOTE: CURRENT VALUES ALIGN TO 1 HOUR PER CLICK (MAY BE REPLACED)
enum TIMEVALUES {
	test = 100000,
	due_2weeks = 336,#336
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

func add_stimuli():
	if clicks == TIMEVALUES.due_2weeks:
		print("added a blanket to the hatchery")
		#transition animation & audio
		#change bg image
	if clicks == TIMEVALUES.due_8weeks:
		print("added an mp3 player to the hatchery")
		#transition animation & audio
		#change bg image
		#mp3playerbutton.disabled = false
	if clicks == TIMEVALUES.due_24weeks:
		print("added some plushies to the hatchery")
		#transition animation & audio
		#change bg image
		#boopbutton.disabled = false

func hatch():
	if clicks == TIMEVALUES.due_2weeks + 48:
		set_ending = "STAGE 0"
	if clicks == TIMEVALUES.due_2weeks + 48:
		set_ending = "STAGE 1"
	if clicks == TIMEVALUES.due_2weeks + 48:
		set_ending = "STAGE 2"
	if clicks == TIMEVALUES.due_2weeks + 48:
		set_ending = "STAGE 3"
	get_tree().change_scene_to_file("res://scenes/game.tscn")

var DIALOGS: Dictionary[int, String] = {
	TIMEVALUES.test: "TEST DIALOGUE\n This is some text\n It'll be output on the dialog panel\n Might make automated tool to add these faster",
	TIMEVALUES.due_2weeks: "TEST: Stage 1 hatch day",
	TIMEVALUES.due_8weeks: "TEST: Stage 2 hatch day",
	TIMEVALUES.due_24weeks: "TEST: Stage 3 hatch day",
	TIMEVALUES.due_40weeks: "TEST: Stage 4 hatch day"
}
