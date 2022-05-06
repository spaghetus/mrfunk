extends Control

onready var goal = $VBoxContainer/Control/Arrow
onready var spawn = $VBoxContainer/Control3/Control/Node2D

export var column = 0

func _ready():
	goal.get_node("Sprite").column = column

func spawn_note(delay: float):
	goal.get_node("Sprite").column = column
	var arrow: Node2D
	if delay > 0:
		arrow = preload("res://reusable/ddrarrows/long_arrow.tscn").instance()
		arrow.get_node("Tail/follower").frame_delay = delay
		arrow.column = column
	else:
		arrow = preload("res://reusable/ddrarrows/arrow_base.tscn").instance()
		arrow.get_node("Sprite").frame_index = 1
		arrow.get_node("Sprite").column = column
	add_child(arrow)
	arrow.global_position = spawn.global_position
	var tween = Tween.new()
	arrow.add_child(tween)
	tween.follow_property(arrow, "global_position", spawn.global_position, goal, "global_position", 1.0)
	tween.start()
	if delay > 0:
		yield(arrow.get_node("Tail/follower"), "met")
	else:
		yield(tween, "tween_completed")
	Util.new().rec_free(arrow)
