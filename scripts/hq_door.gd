extends Area2D


signal ending_started

func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if ScoreManager.face == 3:
		get_parent().texture = load("res://assets/images/crimson_door_open.png")
	else:
		get_parent().texture = load("res://assets/images/crimson_door_close.png")

func _on_body_entered(body):
	if body is not CharacterBody2D or ScoreManager.face != 3:
		return
		
	ending_started.emit()
