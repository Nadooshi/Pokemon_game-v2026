/// @desc  Stop path

with path_target {
	path_end()
	path_delete(path)
}

if global.sc_does_exist(path_target) {
	instance_destroy(path_target)
}

if global.sc_does_exist(target) {
	tgX = target.x
	tgY = target.y
}

tgAngle = point_direction(x, y+12, tgX, tgY+12)
sc_player_move()
