extends Area2D

@onready var player = $"../Player"


@onready var hud = $"../HUD/Control"
@onready var dialog = $"../HUD/Control/DialogText"
@onready var hasDialog = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func set_dialog(content: String) -> void:
	hasDialog = true
	hud.visible = true
	dialog.text = content
	
func close_dialog() -> void:
	hasDialog = false
	hud.visible = false
	dialog.text = ""

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var distance = global_position.distance_to(player.global_position)
		
	if Input.is_action_just_pressed("talk"):
		if hasDialog == true:
			close_dialog()
		elif distance < 250:
			if ScoreManager.fires == 0:
				set_dialog("Yooo, it's me Guy Fieri, yk the flavortown guy, i'm getting kinda cold :(( can you bring me da godot flames so I get can hot again and cook some crazy hackclub events")
			elif ScoreManager.fires < 10:
				set_dialog("waa, you're doing good, %s/10 fires collected, i'm getting hotter :p" % [ScoreManager.fires])
				
	if distance > 375:
		close_dialog()
