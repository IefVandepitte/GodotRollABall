extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var score = 0
var score_max


# Called when the node enters the scene tree for the first time.
func _ready():
	var pickups = get_tree().get_nodes_in_group("Pick Up")
	
	for pickup in pickups:
		pickup.connect("captured", self, "_on_Pick_Up_captured")
		
	score_max = pickups.size()

func _on_Pick_Up_captured():
	$UI/LabelScore.text = "captured"
	score += 1
	$UI/LabelScore.text = "Score: %s" % score
	
	if score == score_max:
		$UI/EndContainer.show()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
