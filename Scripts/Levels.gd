extends Node

export(PackedScene) var level2

func _on_Level1_done():
	var level = level2.instance()
	add_child(level)
