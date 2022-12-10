extends CanvasLayer

var speed: int = 1

signal start
signal speed_change(speed)
signal car_1
signal car_2

func _on_Start_pressed():
	emit_signal('start')

func _on_Speed_pressed():
	if speed == 1: speed = 2
	else: speed = 1
	emit_signal('speed_change', speed)


func _on_Car1_pressed():
	emit_signal('car_1')


func _on_Car2_pressed():
	emit_signal('car_2')
