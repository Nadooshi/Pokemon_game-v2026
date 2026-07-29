/// @arg pokemon_ds_map
function sc_clear_pokemon(_ds) {
    // Проверяем, что передана карта
    if (!ds_exists(_ds, ds_type_map)) return;

    // Безопасно получаем ID вложенных структур
    var _actions_id = _ds[? "actions"];
    var _active_actions_id = _ds[? "active_actions"];

    // Проверяем и уничтожаем actions (предполагаем, что это map)
    if (_actions_id != undefined && _actions_id != -1) {
        if global.sc_does_exist(_actions_id, ds_type_map, "pokemon_actions") {
            ds_map_destroy(_actions_id);
        }
    }

    // Проверяем и уничтожаем active_actions (предполагаем, что это list)
    if (_active_actions_id != undefined && _active_actions_id != -1) {
        if global.sc_does_exist(_active_actions_id, ds_type_list, "pokemon_active_actions") {
            ds_list_destroy(_active_actions_id);
        }
    }

    // Уничтожаем саму карту покемона
    ds_map_destroy(_ds);
}
