tool
extends Sprite

export var w: int = self.texture.region.size.x
export var h: int = self.texture.region.size.y
export var column = 0
export var frame_index = 0

func _process(delta):
	self.texture.region.position.x = column * w
	self.texture.region.position.y = frame_index * h
