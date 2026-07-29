/// @desc End battle


// save dynamic parameters (exp ...)
audio_stop_all()
part_system_clear(global.part_system_wind)
current_trainer = global.player1_trainer
sc_save_battle_result()
sc_save_trainer()

room_goto(rm_endbattle)

