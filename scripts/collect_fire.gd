extends Area2D

var collected = false

func _ready():
	pass

# trigger when coin get touched by a player
func _on_body_entered(body):
	if body is CharacterBody2D and collected == false:
		ScoreManager.fires += 1
		collected = true
		
		$Sound.play()
		$Collision.disabled = true
		
		hide()
