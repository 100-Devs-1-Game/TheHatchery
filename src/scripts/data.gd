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

var test_value: int = 10000

#NOTE: CURRENT VALUES ALIGN TO 1 HOUR PER CLICK (MAY BE REPLACED)
var due_2weeks : int = 336
var due_8weeks : int = 1344
var due_24weeks : int = 4032
var due_40weeks : int = 6720

var array_eventtemplatetext = [
	"It's been a couple of weeks now.",
	"I've been stimulating the egg consitantly, and now I need to make a decision.",
	"Maybe I should add an extra source of heat, to make sure the egg is properly insulated.",
	"It would increase my chances of successfully hatching the egg, but the time it would take to set it up would mean the egg needs more time until it's ready to hatch.",
	"Should I add a/an [item] to the hatchery?" #yes/no prompt indicator, makes buttons visible
]

var DIALOGS: Dictionary[int, String] = {
	test_value: "TEST DIALOGUE\n This is some text\n It'll be output on the dialog panel\n Might make automated tool to add these faster",
	due_2weeks: "TEST: Stage 1 hatch day",
	due_8weeks: "TEST: Stage 2 hatch day",
	due_24weeks: "TEST: Stage 3 hatch day",
	due_40weeks: "TEST: Stage 4 hatch day"
}
