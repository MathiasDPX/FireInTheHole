extends Area2D

var fell = false

func _ready():
	pass

func _on_body_entered(body):
	if body is CharacterBody2D and fell == false and ScoreManager.face != 2:
		fell = true
		body.visible = false
		
		$Sound.play()
		await get_tree().create_timer(0.5).timeout
		
		body.global_position = Vector2(570.0, 444.0)
		fell = false
		body.visible = true
