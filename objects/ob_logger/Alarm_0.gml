/// @desc Save log
	var _log = ""
	
	//ds_list_sort(global.log_battle,true)
	
	for (var i = 0; i < ds_list_size(global.log_battle); i ++){
		
		_log = ds_list_find_value(global.log_battle, i)
		file_text_write_string(fname, _log + "\n");

	}
	ds_list_clear(global.log_battle)
	
	
	//ini_open(fname)
	//	for (var i = 0; i < ds_list_size(global.log_battle); i ++){
	//		_log = ds_list_find_value(global.log_battle, i)
	//		ini_write_string("Log_"+_date, string(len), string(_log))
	//		len++
	//	}
	//	ds_list_clear(global.log_battle)
	//ini_close()
	alarm_set(0, 60)
	
	