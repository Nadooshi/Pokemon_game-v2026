function sc_load_trainer_fnames_old() {
	trainer_count = 0;

	if (!directory_exists("trainer_saves"))
		directory_create("trainer_saves");

	var fn = file_find_first("trainer_saves/*.ini", 0);
	while (string_length(fn) > 0) {
		trainer_fnames[trainer_count] = string_substring(fn, 0, string_pos_ext(".", fn, 0) - 1);
		trainer_count++;
		fn = file_find_next();
	}
	file_find_close();
}

function sc_load_trainer_fnames() {
	trainer_count = 0;

	if (!directory_exists("trainer_saves"))
		directory_create("trainer_saves");

	var fn = file_find_first("trainer_saves/*.txt", 0);
	while (string_length(fn) > 0) {
		trainer_fnames[trainer_count] = string_substring(fn, 0, string_pos_ext(".", fn, 0) - 1);
		trainer_count++;
		fn = file_find_next();
	}
	file_find_close();
}
