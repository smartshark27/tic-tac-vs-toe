extends AudioStreamPlayer2D


var _playing_tic_tac = true


func _ready() -> void:
	_playing_tic_tac = true
	play()


func _on_finished() -> void:
	if _playing_tic_tac:
		_playing_tic_tac = false
		stream = load("res://art/Toe.mp3")
		play()
