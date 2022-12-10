extends CanvasLayer

signal start

func _on_Start_pressed():
	emit_signal('start')
