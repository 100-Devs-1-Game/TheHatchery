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
var lightswitch

#NOTE: CURRENT VALUES ALIGN TO 1 HOUR PER CLICK (MAY BE REPLACED)
enum TIMEVALUES {
	#test = 1,
	due_2weeks = 336,#336
	due_8weeks = 1344,#1344
	due_24weeks = 4032,#4032
	due_40weeks = 6720,#6720
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
	lightswitch.play()
	black.visible = true
	rustling.play()
	

func darkness_transition_pt2(STAGENAME):
	await get_tree().create_timer(1.5).timeout
	current_stage = STAGENAME
	await get_tree().create_timer(1.5).timeout
	lightswitch.play()
	black.visible = false


func add_stimuli():
	if clicks == TIMEVALUES.due_2weeks:
		print("added a blanket to the hatchery")
		darkness_transition_pt1()
		darkness_transition_pt2("STAGE 1")
	if clicks == TIMEVALUES.due_8weeks:
		print("added an mp3 player to the hatchery")
		darkness_transition_pt1()
		#mp3playerbutton.disabled = false
		darkness_transition_pt2("STAGE 2")
	if clicks == TIMEVALUES.due_24weeks:
		print("added some plushies to the hatchery")
		darkness_transition_pt1()
		#boopbutton.disabled = false
		darkness_transition_pt2("STAGE 3")


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
	TIMEVALUES.due_2weeks: "It's been a couple of weeks now. You’ve been stimulating the egg consistently, and now you need to make a decision.\n At this point in development, your baby could benefit from an extra source of heat to make sure they’re properly insulated.\n It would increase the chances of successfully hatching the egg, but the time it would take to set it up would mean it needs more time until it's ready.\n Do you want to insulate the environment by adding a blanket to the hatchery?",
	TIMEVALUES.due_8weeks: "It's been a few of weeks now. You’re still at it, stimulating the egg all day and all night. You need to make another decision.\n Right now, your baby’s growing their ears, isn’t that exciting? It’d be really nice if they had something to listen to while they’re in there. Apparently, babies who listen to classical music come out way smarter, isn’t that interesting?\n It would increase the chances of successfully hatching the egg, but the time it would take to set it up would mean it needs more time until it's ready.\n Do you want to add an MP3 player to the hatchery?",
	TIMEVALUES.due_24weeks: "It's the final check-up day. You’re nearly there, just keep tapping a little while longer and baby " + EggName + " will be here soon. But for now, it’s time for the last decision.\n Your baby’s in the final sprint now, they’ve got everything they need, everything they need to succeed, all they need now is time. And love. Maybe they would enjoy some company?\n It would increase the chances of successfully hatching the egg, but the time it would take to set it up would mean it needs more time until it's ready.\n Do you want to add some friends to the hatchery?",
	#TIMEVALUES.due_40weeks: "TEST: Stage 3 hatch day"
}
