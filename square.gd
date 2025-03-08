extends Area2D

var mark


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	var game = get_tree().root.get_node("Game")
	if not game.winner and event is InputEventMouseButton and event.is_pressed():
		if not $Mark.texture:
			if game.turn == "ticTac":
				mark = "ticTac"
				$Mark.texture = load("res://art/Tic_Tac.png")
			else:
				mark = "toe"
				$Mark.texture = load("res://art/Toe.png")
			
			game.end_turn()
