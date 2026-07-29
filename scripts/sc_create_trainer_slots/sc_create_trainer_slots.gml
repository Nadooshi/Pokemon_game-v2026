function sc_create_trainer_slots() {
	var slot_w;
	var slot_h;

	with instance_create_layer(0, 0, "Frames", ds_map_find_value(global.trainer_slot[0], "ob")) {
		image_xscale = ds_map_find_value(global.trainer_slot[0], "xs")
		image_yscale = ds_map_find_value(global.trainer_slot[0], "ys")
		slot_w = bbox_right - bbox_left
		slot_h = bbox_bottom - bbox_top
		instance_destroy()
	}

	if global.trainer_count == 0
		exit

	var _w = camera_get_view_width(view_camera[1])
	var _xoffset = camera_get_view_x(view_camera[1])
	var rowlength = floor(( _w - 64) / slot_w)
	var rowcount = floor(global.trainer_count / rowlength) + 1

	var _count = 0
	for (var i=0; i<rowcount; i++)
	for (var k=0; k<rowlength; k++) {
		if _count == global.trainer_count
			break
			sc_add_slot_composed(k*slot_w+32 + _xoffset, i*slot_h+32, ds_list_find_value(global.trainer_fnames, _count), global.trainer_slot, ob_frame_trainer)
		_count++
	}

	room_height = max(1080, slot_h * rowcount + 128)




}
