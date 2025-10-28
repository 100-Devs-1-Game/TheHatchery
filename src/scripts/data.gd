extends Node

var clickvalue : int = 1

var eggclickable : bool = true
var clicks : int = 0
var event1passed : bool = false
var textindex : int = 1

var tutorialview : bool = false



var array_eventtemplatetext = [
	"It's been a couple of weeks now.",
	"I've been stimulating the egg consitantly, and now I need to make a decision.",
	"Maybe I should add an extra source of heat, to make sure the egg is properly insulated.",
	"It would increase my chances of successfully hatching the egg, but the time it would take to set it up would mean the egg needs more time until it's ready to hatch.",
	"Should I add a/an [item] to the hatchery?" #yes/no prompt indicator, makes buttons visible
]
