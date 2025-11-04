extends Control

var deathSFX : AudioStreamPlayer

var textstart1 = false
var textstart2 = false

func _ready():
	print(Data.set_ending)
	$Welcome.text = "Welcome to the world, baby " + Data.EggName + "..."
	$Welcome.visible_characters = 0
	$RichTextLabel.visible_characters = 0
	if Data.set_ending == "STAGE 0":
		$RichTextLabel.text = STAGE0dialogue
		deathSFX = $Death_1
		#$Death_1.play()
	if Data.set_ending == "STAGE 1":
		$RichTextLabel.text = STAGE1dialogue
		deathSFX = $Death_2
		#$Death_2.play()
	if Data.set_ending == "STAGE 2":
		$RichTextLabel.text = STAGE2dialogue
		deathSFX = $Death_3
		#$Death_3.play()
	if Data.set_ending == "STAGE 3":
		$RichTextLabel.text = STAGE3dialogue
	$Death_1.play()
	#deathSFX.play()
	await get_tree().create_timer(0.5).timeout
	textstart1 = true
	await get_tree().create_timer(3).timeout
	textstart2 = true


func _process(delta):
	if textstart1 == true:
		$Welcome.visible_characters += 1
	if textstart2 == true:
		$RichTextLabel.visible_characters += 1
	if $RichTextLabel.visible_ratio == 1:
		await get_tree().create_timer(1).timeout
		$Button.visible = true

func _on_button_pressed():
	print("press")
	$ColorRect.visible = true
	$AnimationPlayer.play("fade_to_black")
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://scenes/credits.tscn")



var STAGE0dialogue = "    The egg isn’t moving. It’s hatching time, so it should be moving, but it’s not.

Time to help out baby " + Data.EggName + "!

Oh…

Your baby isn’t alive, but it’s not dead either!
After all, something can’t die if it never lived to begin with.

You were too impatient! Your baby can’t even gestate if you do the bare minimum!

…

Oh well, you can always try again!"

var STAGE1dialogue = "    The egg’s moving a little, but not enough, not enough to crack the shell. You help out baby " + Data.EggName + ".

Oh…

This is wrong. This is all wrong.

A baby was supposed to come out of that egg, a cute little thing, something to call your own. But…

This isn’t a baby.

This is an abomination — a monster, less human than the cells wasted to make it.

This was a mistake. A crime against humanity. This is an utter and complete failure…

…

Oh well… you can always try again."

var STAGE2dialogue = "    You watch, amazed, as baby " + Data.EggName + " makes their way out. They crawl out with tiny fists and must decide that that alone is enough, because they lie down right there, barely an inch out of the shell.

You admire them, the beautiful, yet surprisingly small babe, as they slumber; until you hear a noise. 
They’re choking on air, no, not taking in air at all. Listen to that wheezing.

Your baby is choking on nothing, struggling to breathe, because you didn’t give them long enough.

Baby " + Data.EggName + ", your baby, can’t breathe. Baby " + Data.EggName + " is dying because of you, and you’re just sitting there.

You have to do something.

And you do. You rush into action, grabbing anything and everything that could help while they lie there and suffer. You craft together a rudimentary ventilation crate out of old siphoning tubes, a bike pump and plastic tupperware, placing baby " + Data.EggName + " inside and watching them carefully.

You don’t think they’ll last long, you half expect them to sputter out within the hour, but half a day later, they’re breathing; small, little hiccup breaths, but breaths nevertheless.

After an agonising 24 hours of manually pumping air into the ventilator, you risk taking out " + Data.EggName + " for just a few moments, but they start wheezing again in seconds.

They improve on day 2, able to lie in your cupped hands for a full minute before they become restless.

"+ Data.EggName + " finally starts to accept the powdered milk you’ve been trying to feed them on day 3. They eat like a starved beast, and gulp down a whole bottle even though they’re still only as big as your fist.

Baby " + Data.EggName + " grabs your thumb in both of their tiny hands when you attempt to put them back into the ventilator after an hour’s worth of cuddling on the fourth day.

You start to think that, despite your failures to let them grow just a little longer, with just a little more love, you could be a good parent to baby " + Data.EggName + ".

But then…

…

Baby " + Data.EggName + " lives for 5 days before they pass in your arms.
It’s just 5 days, a mere 120 hours, but…

Those 5 days meant everything.

…

You did the impossible; you succeeded. But at what cost?

Maybe it’s not worth trying again."


var STAGE3dialogue = "    It’s finally hatching day.

The egg is shaking vigorously, and in no time at all, it smacks about the bottom of the hatchery and cleanly cracks open. And out crawls…

The most perfect baby.

Hello, baby " + Data.EggName + ". Aren’t you a dear?

A thorough inspection is needed. You complete a full exam on the offspring; you test their hearing, their sight, and their sense of touch. There’s no need to test their sense of attachment, because the moment you go to take them away from your chest, they screech like a banshee.

This sweet little thing, who came from an egg, of all places, is a darling, and you are obsessed.

You become so invested in the specimen, no, your child, that you begin to neglect everything else in your life.

Your boss starts to call your phone after you don’t show up to work for a few days, then your neighbours start to peep around your home to see if you’re still alive, then the police come by to do wellness checks.

You ignore all of them.

Because they don’t matter anymore. People don’t matter, friends don’t matter, family doesn’t matter. Your life before doesn’t matter; nothing else matters, not anymore.

The homunclus hatchery project was a massive success, and that’s all you ever wanted.

Congratulations. What will you do next?"
