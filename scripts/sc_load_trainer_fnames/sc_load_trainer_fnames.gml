function sc_load_trainer_fnames_old() {
	global.trainer_count = 0;
	global.trainer_fnames = ds_list_create();
	
	if (!directory_exists("trainer_saves"))
		directory_create("trainer_saves");
	
	var fn = file_find_first("trainer_saves/*.ini", 0);
	while (string_length(fn) > 0) {
		var name = string_copy(fn, 0, string_pos_ext(".", fn, 0) - 1);
		ds_list_add(global.trainer_fnames, name);
		global.trainer_count++;
		fn = file_find_next();
	}
	file_find_close();
}

function sc_load_trainer_fnames() {
	global.trainer_fnames = ds_list_create();
	global.trainer_count = 0;
	if (ds_exists(global.trainer_fnames, ds_type_list))
		ds_list_destroy(global.trainer_fnames);
	global.trainer_fnames = ds_list_create();
	
	if (!directory_exists("trainer_saves"))
		directory_create("trainer_saves");
	
	var fn = file_find_first("trainer_saves/*.txt", 0);
	while (string_length(fn) > 0) {
		var name = string_copy(fn, 0, string_pos_ext(".", fn, 0) - 1);
		ds_list_add(global.trainer_fnames, name);
		global.trainer_count++;
		fn = file_find_next();
	}
	file_find_close();
}
