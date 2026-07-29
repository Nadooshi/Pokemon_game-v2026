/// @desc

// Inherit the parent event
event_inherited();

if not ds_exists(global.player1_trainer, ds_type_map) or
   not ds_exists(global.player2_trainer, ds_type_map) {
	show_message("Choose trainer, please!")
	exit
}
//	global.player2_trainer = sc_new_trainer()

// reload trainers
sc_clear_trainer(global.player1_trainer)//; global.player1_trainer = sc_new_trainer()
sc_clear_trainer(global.player2_trainer)//; global.player2_trainer = sc_new_trainer()
global.player1_trainer = sc_load_trainer(ob_frame_trainer_1.name)
global.player2_trainer = sc_load_trainer(ob_frame_trainer_2.name)

if ds_list_size(global.player1_trainer[? "active_pokemon_list"]) > 0 and
	ds_list_size(global.player2_trainer[? "active_pokemon_list"]) > 0
//	room_goto(rm_battle)
	room_goto(rm_versus)
else
	show_message("Cannot start battle! Either of trainers have no any active pokemon!")
