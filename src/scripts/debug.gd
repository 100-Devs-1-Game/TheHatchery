extends Control

@onready var clicks = D.clicks


func _process(_delta):
	# NOTE: DISPLAYS CURRENT CLICK VALUE
	#$Label.text = "%d clicks" % int(clicks)
	if clicks == 1:
		$"../ClickCounter".text = str(clicks) + " click"
	else:
		$"../ClickCounter".text = str(clicks) + " clicks"
	#print($Timer.wait_time - $Timer.time_left)
