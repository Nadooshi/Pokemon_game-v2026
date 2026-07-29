/// @desc Game End - Force save logs before exit

// Принудительно вызываем событие будильника для сохранения последних логов
if (!is_undefined(global.log_battle) && ds_list_size(global.log_battle) > 0) {
    event_perform(ev_alarm, 0);
}
