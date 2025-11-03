extends Control

func _ready():
	$ColorRect.modulate = Color(0, 0, 100, 0)
	await get_tree().create_timer(1).timeout
	$"C&C".play()
	$CreditFadeIn.play("fade_in")
