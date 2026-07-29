/// @desc 

// Inherit the parent event
event_inherited();


if is_undefined(name) or name=""
	exit
	
current_trainer = sc_load_trainer(name)

var _x, _y;
if not ds_exists(global.player1_trainer, ds_type_map) {
	global.player1_trainer = ds_map_create()
	ds_map_copy(global.player1_trainer, current_trainer)

	with ob_frame_trainer_1 {
		_x = x
		_y = y
		instance_destroy()
	}
	with sc_add_slot_composed(_x, _y, name, global.trainer_slot, ob_frame_trainer_1)
		event_perform(ev_other, ev_user0)
} else 
if not ds_exists(global.player2_trainer, ds_type_map) {
	global.player2_trainer = ds_map_create()
	ds_map_copy(global.player2_trainer, current_trainer)
	with ob_frame_trainer_2 {
		_x = x
		_y = y
		instance_destroy()
	}
	with sc_add_slot_composed(_x, _y, name, global.trainer_slot, ob_frame_trainer_2)
		event_perform(ev_other, ev_user0)
}

