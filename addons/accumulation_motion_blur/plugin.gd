@tool
extends EditorPlugin


func _enter_tree() -> void:
	add_autoload_singleton("AccumulationMotionBlur", "res://addons/accumulation_motion_blur/accumulation_motion_blur.tscn")


func _exit_tree() -> void:
	remove_autoload_singleton("AccumulationMotionBlur")
