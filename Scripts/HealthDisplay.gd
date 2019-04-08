extends RichTextLabel

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func change_text(attacker, victim):
	text = str(get_parent().find_node("Hitable").hp)
#	text = str("hit! Attacker: "+ attacker.name + ", Victim: "+victim.name)

func change_text_simple(hp):
	text = str(hp)

func _on_Hitable__on_hp_change(hp):
	text = str(hp)
