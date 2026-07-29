/// @desc Room Start - Initialize logging

// Инициализируем глобальный список логов, если он ещё не создан
if (is_undefined(global.log_battle) || ds_list_empty(global.log_battle)) {
    if (!is_undefined(global.log_battle)) {
        ds_list_destroy(global.log_battle);
    }
    global.log_battle = ds_list_create();
}

var _date = date_date_string(date_current_datetime());
fname = file_text_open_write("log_saves/" + _date + ".txt");

if (fname == -1) {
    show_debug_message("ERROR: Could not open log file for writing: log_saves/" + _date + ".txt");
    // Создаём директорию, если она не существует (опционально, требует расширения)
    // directory_create("log_saves");
    // fname = file_text_open_write("log_saves/" + _date + ".txt");
} else {
    show_debug_message("Log file opened successfully: " + string(fname));
}

// Устанавливаем будильник для периодической записи
alarm_set(0, 300);
