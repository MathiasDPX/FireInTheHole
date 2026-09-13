extends Area2D

signal get_coin

var collected = false

func _ready():
	pass

# trigger when coin get touched by a player
func _on_body_entered(body):
	if body is CharacterBody2D and collected == false:
		emit_signal("get_coin")
		collected = true
		
		$Sound.play()
		$Collision.disabled = true
		
		hide()
