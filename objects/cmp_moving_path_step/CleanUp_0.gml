/// @desc  Stop path


if global.sc_does_exist(target) {
	tgX = target.x
	tgY = target.y
}

tgAngle = point_direction(x, y+12, tgX, tgY+12)
sc_player_move()
