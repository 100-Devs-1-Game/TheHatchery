extends Node2D

@onready var display: Label = $Label

func _input(event: InputEvent) -> void:
	var hours = Data.clicks % 24
	var days = (floori(Data.clicks / 24.0) % 31) + 1
	var months = (floori(Data.clicks / (24.0 * 31.0)) % 12) + 1
	var years = (floori(Data.clicks / (24.0 * 31.0 * 365.0))) + 1
	
	var stringed_hours = "0" + str(hours) if hours < 10 else str(hours)
	var stringed_days = "0" + str(days) if days < 10 else str(days)
	var stringed_months = "0" + str(months) if months < 10 else str(months)
	var stringed_years = "0" + str(years) if years < 10 else str(years)
	display.text = "00:" + stringed_hours + " / " + stringed_days + " / " + stringed_months + " / " + stringed_years
