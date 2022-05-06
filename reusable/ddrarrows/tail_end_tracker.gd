tool
extends Node2D

export var tail_path: NodePath
export var head_path: NodePath

onready var tail: Node2D = get_node(tail_path)
onready var end: Node2D = $TailEnd
onready var middle: Node2D = $TailMiddle
onready var head: Node2D = get_node(head_path)

func _process(delta):
	global_position = tail.global_position
	global_rotation = (global_position - head.global_position).angle() - (PI/2)
	var distance = global_position.distance_to(head.global_position) - 2
	middle.position.y = -(distance / 2) - 1
	middle.scale.y = distance
	end.column = head.column
	middle.column = head.column
	pass
