// ini file should be already opened
// returns action map
// Parameters for action are in 'sc_new_action', 'sc_load_action', 'sc_load_pokemon'
function sc_load_action(_name, _pokemon_map){
    var _map = ds_map_create();

    var _ini_data = ini_read_string("actions", _name, "");
    if (_ini_data == "") {
        show_debug_message("ERROR: Action not found in INI: " + string(_name));
        ds_map_destroy(_map);
        return undefined;
    }
    ds_map_read(_map, _ini_data);

    // set damage by level
    var _base_damage = _map[? "damage"];
    var _base_element = _map[? "dmg_element"];
    
    // Calculate ratio safely to avoid division by zero
    var _ratio = 0;
    if (_base_damage != 0) {
        // Ensure _base_element is also valid before dividing
        if (!is_undefined(_base_element)) {
            _ratio = _base_element / _base_damage;
        }
    }

    var _new_damage = sc_calculate_formula(5, _map[? "act_force"], _pokemon_map[? "actions"][? _name][? "pa_lvl"], _map[? "act_force"], _base_damage, _map[? "level"]);
    
    _map[? "damage"] = _new_damage;
    _map[? "dmg_element"] = _new_damage * _ratio;
    _map[? "dmg_material"] = _new_damage - _map[? "dmg_element"];

    var _action_data = _pokemon_map[? "actions"][? _name];
    if (!is_undefined(_action_data)) {
        _map[? "prev_exp"]    = _action_data[? "pa_prevexp"];
        _map[? "battle_exp"]  = _action_data[? "pa_exp"];
        _map[? "level"]       = _action_data[? "pa_lvl"];
        _map[? "nextlvl_exp"] = _action_data[? "pa_nextlvl_exp"];
        _map[? "levelup"]     = _action_data[? "pa_levelup"];
        _action_data[? "pa_levelup"] = false;
        _map[? "lvlup_mod"]   = (_action_data[? "pa_lvlup_mod"]) ?? 0;
    } else {
        show_debug_message("WARNING: Action data missing for: " + string(_name));
        _map[? "prev_exp"]    = 0;
        _map[? "battle_exp"]  = 0;
        _map[? "level"]       = 1;
        _map[? "nextlvl_exp"] = 0;
        _map[? "levelup"]     = false;
        _map[? "lvlup_mod"]   = 0;
    }

    var _cd = 0;
    if (!is_undefined(_action_data) && _action_data[? "repeatable"] == true) { // true => не повторяется
        _cd = disposable_action_cooldown;
    }
    _map[? "cooldown"] = _cd;

    if (!is_undefined(_map[? "active"])) {
        var _map_abil = ds_map_create();
        var _abil_data = ini_read_string("abilities", _map[? "active"], "");
        if (_abil_data != "") {
            ds_map_read(_map_abil, _abil_data);
            if sc_does_exist(_map_abil) {
                _map[? "active"] = _map_abil;
            } else {
                ds_map_destroy(_map_abil);
                _map[? "active"] = undefined;
            }
        } else {
            ds_map_destroy(_map_abil);
            _map[? "active"] = undefined;
        }
    }

    return _map;
}
