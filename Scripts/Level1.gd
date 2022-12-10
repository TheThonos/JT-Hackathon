extends Node

signal done


func _on_Car1_done():
	emit_signal('done')
	queue_free()
