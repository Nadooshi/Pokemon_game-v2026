/// @description Создает игрока (покемона) на сцене
/// @param {struct} map Карта данных покемона
/// @param {struct} trainer Данные тренера
/// @returns {real} ID созданного экземпляра
function sc_create_player(_map, _trainer) {

    var _result = noone;
    var _sprite_index = noone;
    var _acceleration_table = [0.3, 0.1, 0.05, 0.01];
    
    // Создаем экземпляр игрока на слое "Game"
    with instance_create_layer(0, 0, "Game", ob_player) {
        
        // === Инициализация базовых свойств ===
        _result = id;
        trainer = _trainer;
        pokemon_map = _map;
        
        // Копируем предыдущий опыт перед любыми изменениями
        pokemon_map[? "prev_exp"] = pokemon_map[? "exp"];
        
        // === Настройка характеристик ===
        size = pokemon_map[? "size"];
        dAngle = 5 - size;
        health_max = pokemon_map[? "health"];
        health_cur = health_max;
        maxSpeed = pokemon_map[? "ap"] * 0.25;
        accel = _acceleration_table[size];
        
        // === Настройка спрайта ===
        _sprite_index = asset_get_index("sp_pokeworld_" + string(pokemon_map[? "face"]));
        if sprite_exists(_sprite_index) {
            sprite_index = _sprite_index;
        }
        
        // Масштабирование для гигантских покемонов
        if size == _SIZE.giant {
            image_xscale = 1.5;
            image_yscale = 1.5;
        }
    
        // === Загрузка активных действий ===
        ds_list_clear(action_list);
        var _action_list = pokemon_map[? "active_actions"];
        var _action_map;
        
        if ini_open(global.pokemon_path) {
            for (var i = 0; i < ds_list_size(_action_list); i++) {
                _action_map = undefined;
                
                if !is_undefined(_action_list[| i]) {
                    _action_map = sc_load_action(_action_list[| i], pokemon_map);
                    
                    if !sc_precalc_action_values(_action_map, id) {
                        show_message("ERROR: NO distance calculated for action " + string(i));
                    }
                }
                
                ds_list_add(action_list, _action_map);
            }
            ini_close();
        } else {
            show_message("ERROR: Could not open pokemon ini file: " + string(global.pokemon_path));
        }
        
        // === Загрузка пассивных способностей ===
        helper_load_passive = function(_passive_key, _state_var) {
            var _passive_name = pokemon_map[? _passive_key];
            
            if !is_undefined(_passive_name) && _passive_name != "" {
                var _new_state = ds_map_create();
                var _ability_data = ini_read_string("abilities", _passive_name, "");
                
                if _ability_data != "" {
                    ds_map_read(_new_state, _ability_data);
                    variable_global_set(_state_var, _new_state);
                } else {
                    ds_map_destroy(_new_state);
                    show_message("WARNING: Ability '" + _passive_name + "' not found in ini");
                }
            }
        };
        
        helper_load_passive("passive_1", "passive_state1");
        helper_load_passive("passive_2", "passive_state2");
    
        // === Установка начальной позиции ===
        var _position = pokemon_map[? "position_stage"];
        
        switch (_position) {
            case _POSITION.fly:
                event_perform(ev_other, ev_user4);
                break;
            case _POSITION.underground:
                event_perform(ev_other, ev_user2);
                break;
        }
    }

    return _result;
}
