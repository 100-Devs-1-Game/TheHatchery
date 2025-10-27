extends Control

var clicks : int = 0
var event1passed : bool = false

func _on_click_target_pressed():
	clicks += 1
	print("you clicked")

func _process(_delta):
	# NOTE: DISPLAYS CURRENT CLICK VALUE
	#$Label.text = "%d clicks" % int(clicks)
	if clicks == 1:
		$Label.text = str(clicks) + " click"
	else:
		$Label.text = str(clicks) + " clicks"
	
	# NOTE: CLICK VALUE-BASED EVENT TEMPLATE
	if clicks == 100:
		print("you reached 100")


func event1template():
	null
	#show text
	#show next text on input
	#hide text
