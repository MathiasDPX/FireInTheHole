extends Sprite2D

@onready var isEnding = false
@onready var dialogStep = 0

@onready var hud = $"../HUD/Control"
@onready var dialog = $"../HUD/Control/DialogText"

func set_dialog(content: String) -> void:
	hud.visible = true
	dialog.text = content
	
func close_dialog() -> void:
	hud.visible = false
	dialog.text = ""

func _ready() -> void:
	$"../HQ_Door/Area2D".ending_started.connect(start_ending)
	self.texture = load("res://assets/images/guy_fieri.png")

func start_ending() -> void:
	isEnding = true
	set_dialog("hiii, welcome to HQ! thanks you for helping get my powers back!! i can now make a bunch of cool ysws and events ykyk\n\n(it's a long dialog btw, press X go to the next line)")

func _process(_delta: float) -> void:
	if isEnding == false:
		return
	
	if Input.is_action_just_pressed("talk"):
		dialogStep += 1
		
		if dialogStep == 1:
			set_dialog("GUY: btw, Guy Fieri is only my Flavortown's apparence, in reality, I am...")
		elif dialogStep == 2:
			self.texture = load("res://assets/images/zach_latta.png")
			set_dialog("ZACH LATTA!")
		elif dialogStep == 3:
			set_dialog("ZACH: anyways, I'd like to thank you for giving me my powers back, I've been stuck like this for almost 5 months, since flavortown ended 😭🙏")
		elif dialogStep == 4:
			set_dialog("ZACH: i'd like to show you something behind human comprehension")
		elif dialogStep == 5:
			set_dialog("ZACH: something that transcend time and space ITSELF")
		elif dialogStep == 6:
			set_dialog("ZACH: Are you ready to see this?")
		elif dialogStep == 7:
			set_dialog("YOU: Hell yeah")
		elif dialogStep == 8:
			set_dialog("ZACH: OK, this might be the most wonderful moment of your life or the last one :p bleh")
		elif dialogStep == 9:
			set_dialog("ZACH: I present to you....")
		elif dialogStep == 10:
			set_dialog("ZACH: VERTICAL SLAB!")
			$VerticalSlabs.visible = true
		elif dialogStep == 11:
			set_dialog("YOU: ARARARJAGHJAJAHJHAAAAHHGHGHGAA bleh this is horror that I cannot comprehend")
		elif dialogStep == 12:
			set_dialog("YOU: how... can it.... BE")
		elif dialogStep == 13:
			set_dialog("YOU: how does the world can hold itself after ")
		elif dialogStep == 14:
			set_dialog("ZACH: it can't :pp")
		elif dialogStep == 15:
			$Explosion.visible = true
			$Sound.play()
			await $Sound.playing == false
		elif dialogStep == 16:
			set_dialog("mathias: hello it's meeee mathias, the guy who made da game (it's still a dialog)")
		elif dialogStep == 17:
			set_dialog("mathias: thanks you for playing this game, it was made for Haven cuz i'm organizing Haven Paris")
		elif dialogStep == 18:
			set_dialog("mathias: you should come to Haven Paris :yesyes:")
		elif dialogStep == 19:
			set_dialog("mathias: uuh ya that's all you can leave thx bye bye 😘")
