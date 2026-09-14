extends Area2D

@onready var player = $"../Player"

@onready var hud = $"../HUD/Control"
@onready var dialog = $"../HUD/Control/DialogText"
@onready var hasDialog = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	close_dialog()


func set_dialog(content: String) -> void:
	hasDialog = true
	hud.visible = true
	dialog.text = content
	
func close_dialog() -> void:
	hasDialog = false
	hud.visible = false
	dialog.text = ""

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var distance = global_position.distance_to(player.global_position)
		
	if Input.is_action_just_pressed("talk"):
		if hasDialog == true:
			close_dialog()
		elif distance < 250:
			if ScoreManager.claimed_fires != ScoreManager.fires:
				# fires were not claimed, give powerup
				if ScoreManager.fires == 1:
					set_dialog(":yayayayayay: i can feel my powers coming back, thank u :3\nhere's a new power, press C to switch between face\neach face give special powers")
				elif ScoreManager.fires == 2:
					set_dialog(":wowsers: wawaawawaawawa i'm getting so strong like Flavortown prime, only one left 👏\nyou can now get angy")
				
				ScoreManager.claimed_fires += 1
			else:
				if ScoreManager.fires == 0:
					set_dialog("Yooo, it's me Guy Fieri, yk the flavortown guy, i'm getting kinda cold :(( can you bring me da godot flames so I get can hot again and cook some crazy hackclub events\ncome back after getting one so I can give you sum free stuff 🤑")
				elif ScoreManager.fires < 3:
					set_dialog("waa, you're doing good, %s/3 artifacts collected, i'm getting hotter :p" % [ScoreManager.fires])
				
	if distance > 375 and hasDialog:
		close_dialog()
