extends Node

export var follow_target_path: NodePath
export var frame_delay: int = 30

var position_history = PoolVector2Array()
onready var follow_target: Node2D = get_node(follow_target_path)

signal met

func _process(delta):
	position_history.push_back(follow_target.global_position)
	if len(position_history) > frame_delay:
		position_history.remove(0)
	if len(position_history) > 0:
		get_parent().global_position = position_history[0]
	if len(position_history) > 2:
		if get_parent().global_position == follow_target.global_position:
			emit_signal("met")
	else:
		get_parent().global_position = follow_target.global_position
	
	pass
