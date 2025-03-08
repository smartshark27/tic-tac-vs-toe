extends Node2D

var turn
var winner = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	turn = ["ticTac", "toe"].pick_random()
	_set_mark_for_turn()


func _set_mark_for_turn() -> void:
	if turn == "ticTac":
		$HUD/Mark.texture = load("res://art/Tic_Tac.png")
	else:
		$HUD/Mark.texture = load("res://art/Toe.png")


func end_turn() -> void:
	_check_win_condition()
	
	if winner:
		_set_winner(winner)
		return

	if turn == "ticTac":
		turn = "toe"
	else:
		turn = "ticTac"

	_set_mark_for_turn()


func _check_win_condition() -> void:
	var topLeftMark = $Grid/TopLeft.mark
	var topMiddleMark = $Grid/TopMiddle.mark
	var topRightMark = $Grid/TopRight.mark
	var middleLeftMark = $Grid/MiddleLeft.mark
	var middleMark = $Grid/Middle.mark
	var middleRightMark = $Grid/MiddleRight.mark
	var bottomLeftMark = $Grid/BottomLeft.mark
	var bottomMiddleMark = $Grid/BottomMiddle.mark
	var bottomRightMark = $Grid/BottomRight.mark

	if topLeftMark and topLeftMark == topMiddleMark and topLeftMark == topRightMark:
		winner = topLeftMark
	elif topLeftMark and topLeftMark == middleMark and topLeftMark == bottomRightMark:
		winner = topLeftMark
	elif topLeftMark and topLeftMark == middleLeftMark and topLeftMark == bottomLeftMark:
		winner = topLeftMark
	elif topMiddleMark and topMiddleMark == middleMark and topMiddleMark == bottomMiddleMark:
		winner = topMiddleMark
	elif topRightMark and topRightMark == middleMark and topRightMark == bottomLeftMark:
		winner = topRightMark
	elif topRightMark and topRightMark == middleRightMark and topRightMark == bottomRightMark:
		winner = topRightMark
	elif middleLeftMark and middleLeftMark == middleMark and middleLeftMark == middleRightMark:
		winner = middleLeftMark
	elif bottomLeftMark and bottomLeftMark == bottomMiddleMark and bottomLeftMark == bottomRightMark:
		winner = bottomLeftMark
	
	elif [topLeftMark, topMiddleMark, topRightMark,
			middleLeftMark, middleMark, middleRightMark,
			bottomLeftMark, bottomMiddleMark, bottomRightMark].all(func(mark): return mark):
		winner = "nobody"


func _set_winner(winner) -> void:
	if winner == "ticTac":
		$HUD/Label.text = "The winner is"
		$HUD/Mark.texture = load("res://art/Tic_Tac.png")
	elif winner == "toe":
		$HUD/Label.text = "The winner is"
		$HUD/Mark.texture = load("res://art/Toe.png")
	else:
		$HUD/Label.text = "Nobody wins"
		$HUD/Mark.texture = null
	
