/// @desc Save log - Periodically save battle logs to file

var _log = "";

// Проверяем, существует ли файл и список логов
if (fname == -1 || is_undefined(fname)) {
    show_debug_message("WARNING: Log file is not open. Skipping log write.");
    alarm_set(0, 60);
    exit;
}

if (is_undefined(global.log_battle)) {
    show_debug_message("WARNING: global.log_battle is undefined. Creating new list.");
    global.log_battle = ds_list_create();
}

var _list_size = ds_list_size(global.log_battle);

if (_list_size > 0) {
    for (var i = 0; i < _list_size; i++) {
        _log = ds_list_find_value(global.log_battle, i);
        
        // Проверяем, что строка не undefined перед записью
        if (!is_undefined(_log)) {
            file_text_write_string(fname, string(_log) + "\n");
        } else {
            show_debug_message("WARNING: Log entry at index " + string(i) + " is undefined.");
        }
    }
    
    // Очищаем список после записи
    ds_list_clear(global.log_battle);
    show_debug_message("Log saved successfully. Entries written: " + string(_list_size));
} else {
    // Если логов нет, просто пишем пустую строку или отметку
    // file_text_write_string(fname, "--- No battle events in this interval ---\n");
}

// Перезпускаем будильник для следующей записи через 60 кадров (1 секунда при 60 FPS)
alarm_set(0, 60);
