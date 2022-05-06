extends Object
class_name Util

func rec_free(node: Node):
	for c in node.get_children():
		rec_free(c)
	node.queue_free()
