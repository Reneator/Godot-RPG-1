extends Node


func _ready():
	get_parent().add_to_group("collectable")


func collect():
	get_parent().get_parent().remove_child(self.get_parent())