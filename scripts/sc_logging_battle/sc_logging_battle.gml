/// Logs damage events in battle
/// @param {Object} _subject - Initiator pokemon instance
/// @param {Object} _object - Recipient pokemon instance or other object
/// @param {Map} _action - Action map containing attack details
/// @param {Real} _value - Damage, heal, or other value amount
function sc_logging_damage(_subject, _object, _action, _value) {
    if (_value == 0) {
        return;
    }

    var _relation = (_subject.trainer != _object.trainer) ? "hostile" : "friend";
    var _log_text = "";
    var _timestamp = date_time_string(date_current_datetime());

    // Safe name retrieval
    var _trainer_name = (_object.trainer != noone && !is_undefined(_object.trainer[? "name"])) ? _object.trainer[? "name"] : "Unknown";
    var _target_name = (!is_undefined(_object.pokemon_map[? "title"])) ? _object.pokemon_map[? "title"] : "Unknown Target";
    var _attacker_name = (!is_undefined(_subject.pokemon_map[? "title"])) ? _subject.pokemon_map[? "title"] : "Unknown Attacker";
    var _action_name = (!is_undefined(_action[? "name"])) ? _action[? "name"] : "Unknown Action";

    if (_object.trainer != -1 && _object.trainer != noone) {
        _log_text = "[" + _timestamp + "]: " + string(_trainer_name) + "'s " + 
                    _target_name + " (" + string(_object.id) + ") " + 
                    "is injured for " + string(_value) + " by " + 
                    _action_name + " from " + _relation + " " + 
                    _attacker_name + " (" + string(_subject.id) + ")";
    } else {
        _log_text = "[" + _timestamp + "]: " + string(_trainer_name) + "'s " + 
                    _action_name + " impact at barrier.";
    }

    ds_list_add(log_battle, _log_text);
}


/// Logs action usage in battle
/// @param {Object} _subject - Initiator pokemon instance
/// @param {Map} _action - Action map used
function sc_logging_action(_subject, _action) {
    var _verb = "uses";
    var _action_type = _action[? "type"];

    switch (_action_type) {
        case _ATTACK_TYPE.range:
        case _ATTACK_TYPE.wave:
        case _ATTACK_TYPE.mortar:
        case _ATTACK_TYPE.ray:
            _verb = "shoots";
            break;
        case _ATTACK_TYPE.aura:
        case _ATTACK_TYPE.cloud:
        case _ATTACK_TYPE.pool:
            _verb = "spews";
            break;
        case _ATTACK_TYPE.front:
        case _ATTACK_TYPE.melee:
            _verb = "hits with";
            break;
        case _ATTACK_TYPE.lunge:
        case _ATTACK_TYPE.swoop:
            _verb = "rushes with";
            break;
        case _ATTACK_TYPE.barrier:
            _verb = "installs";
            break;
    }

    var _trainer_name = (_subject.trainer != noone && !is_undefined(_subject.trainer[? "name"])) ? _subject.trainer[? "name"] : "Unknown";
    var _pokemon_name = (!is_undefined(_subject.pokemon_map[? "title"])) ? _subject.pokemon_map[? "title"] : "Unknown Pokemon";
    var _action_name = (!is_undefined(_action[? "name"])) ? _action[? "name"] : "Unknown Action";
    
    var _log_text = "[" + date_time_string(date_current_datetime()) + "]: " + 
                    string(_trainer_name) + "'s " + 
                    _pokemon_name + " (" + string(_subject.id) + ") " + 
                    _verb + " " + _action_name;

    ds_list_add(log_battle, _log_text);
}


/// Logs missed attacks in battle
/// @param {Object} _subject - Initiator pokemon instance
/// @param {Object} _object - Target pokemon instance
/// @param {Map} _action - Action map that missed
function sc_logging_miss(_subject, _object, _action) {
    var _relation = (_subject.trainer != _object.trainer) ? "hostile" : "friend";
    var _log_text = "";

    var _trainer_name = (_object.trainer != noone && !is_undefined(_object.trainer[? "name"])) ? _object.trainer[? "name"] : "Unknown";
    var _target_name = (!is_undefined(_object.pokemon_map[? "title"])) ? _object.pokemon_map[? "title"] : "Unknown Target";
    var _attacker_name = (!is_undefined(_subject.pokemon_map[? "title"])) ? _subject.pokemon_map[? "title"] : "Unknown Attacker";
    var _action_name = (!is_undefined(_action[? "name"])) ? _action[? "name"] : "Unknown Action";

    if (_object.trainer != -1 && _object.trainer != noone) {
        _log_text = "[" + date_time_string(date_current_datetime()) + "]: " + 
                    string(_trainer_name) + "'s " + 
                    _target_name + " (" + string(_object.id) + ") " + 
                    "dodged " + _attacker_name + " (" + string(_subject.id) + ")'s " + 
                    _action_name;
    } else {
        _log_text = "[" + date_time_string(date_current_datetime()) + "]: " + 
                    string(_trainer_name) + "'s " + 
                    _action_name + " overpassed barrier.";
    }

    ds_list_add(log_battle, _log_text);
}


/// Logs death events in battle
/// @param {Object} _subject - Killer pokemon instance
/// @param {Object} _object - Deceased pokemon instance
/// @param {Map} _action - Action that caused death
function sc_logging_death(_subject, _object, _action) {
    var _relation = (_subject.trainer != _object.trainer) ? "hostile" : "friendly";
    
    // Handle cases where action name might be nested or undefined
    var _action_name = "unknown cause";
    if (!is_undefined(_action)) {
        if (!is_undefined(_action[? "name"])) {
            _action_name = _action[? "name"];
        } else if (!is_undefined(_action[? "active"]) && !is_undefined(_action[? "active"][? "name"])) {
            _action_name = _action[? "active"][? "name"];
        }
    }

    var _trainer_name = (_object.trainer != noone && !is_undefined(_object.trainer[? "name"])) ? _object.trainer[? "name"] : "Unknown";
    var _target_name = (!is_undefined(_object.pokemon_map[? "title"])) ? _object.pokemon_map[? "title"] : "Unknown Target";
    var _attacker_name = (!is_undefined(_subject.pokemon_map[? "title"])) ? _subject.pokemon_map[? "title"] : "Unknown Attacker";

    var _log_text = "[" + date_time_string(date_current_datetime()) + "]: " + 
                    string(_trainer_name) + "'s " + 
                    _target_name + " (" + string(_object.id) + ") " + 
                    "cannot continue the fight, as the " + _action_name + " " + _relation + 
                    " of " + _attacker_name + " (" + string(_subject.id) + ") finished him.";

    ds_list_add(log_battle, _log_text);
}


/// Logs state loss effects (e.g., losing stats)
/// @param {Object} _object - Affected pokemon instance
/// @param {String} _state_name - Name of the state
/// @param {String} _what_do - Description of what happened
/// @param {String} _parameter - Parameter affected
/// @param {Real} _value - Value change amount
function sc_logging_state_loses(_object, _state_name, _what_do, _parameter, _value) {
    if (_object.trainer == -1 || _object.trainer == noone) {
        return;
    }

    var _trainer_name = (!is_undefined(_object.trainer[? "name"])) ? _object.trainer[? "name"] : "Unknown";
    var _pokemon_name = (!is_undefined(_object.pokemon_map[? "title"])) ? _object.pokemon_map[? "title"] : "Unknown Pokemon";

    var _log_text = "[" + date_time_string(date_current_datetime()) + "]: " + 
                    string(_trainer_name) + "'s " + 
                    _pokemon_name + " (" + string(_object.id) + ") " + 
                    "is " + _what_do + " from " + _state_name + 
                    " and loses " + _parameter + " by " + string(_value);

    ds_list_add(log_battle, _log_text);
}


/// Logs state gain effects (e.g., gaining stats)
/// @param {Object} _object - Affected pokemon instance
/// @param {String} _state_name - Name of the state
/// @param {String} _what_do - Description of what happened
/// @param {String} _parameter - Parameter affected
/// @param {Real} _value - Value change amount
function sc_logging_state_rises(_object, _state_name, _what_do, _parameter, _value) {
    if (_object.trainer == -1 || _object.trainer == noone) {
        return;
    }

    var _trainer_name = (!is_undefined(_object.trainer[? "name"])) ? _object.trainer[? "name"] : "Unknown";
    var _pokemon_name = (!is_undefined(_object.pokemon_map[? "title"])) ? _object.pokemon_map[? "title"] : "Unknown Pokemon";

    var _log_text = "[" + date_time_string(date_current_datetime()) + "]: " + 
                    string(_trainer_name) + "'s " + 
                    _pokemon_name + " (" + string(_object.id) + ") " + 
                    "is " + _what_do + " from " + _state_name + 
                    " and rises " + _parameter + " by " + string(_value);

    ds_list_add(log_battle, _log_text);
}


/// Logs state curse effects
/// @param {Object} _object - Affected pokemon instance
/// @param {String} _state_name - Name of the state
/// @param {String} _what_do - Description of effect
function sc_logging_state_cursed(_object, _state_name, _what_do) {
    if (_object.trainer == -1 || _object.trainer == noone) {
        return;
    }

    var _trainer_name = (!is_undefined(_object.trainer[? "name"])) ? _object.trainer[? "name"] : "Unknown";
    var _pokemon_name = (!is_undefined(_object.pokemon_map[? "title"])) ? _object.pokemon_map[? "title"] : "Unknown Pokemon";

    var _log_text = "[" + date_time_string(date_current_datetime()) + "]: " + 
                    string(_trainer_name) + "'s " + 
                    _pokemon_name + " (" + string(_object.id) + ") " + 
                    "was in a " + _state_name + " and " + _what_do;

    ds_list_add(log_battle, _log_text);
}


/// Logs state power-up effects
/// @param {Object} _object - Affected pokemon instance
/// @param {String} _state_name - Name of the state
/// @param {String} _what_do - Description of effect
/// @param {String} _parameter - Parameter affected
/// @param {Real} _value - New value
function sc_logging_state_powered(_object, _state_name, _what_do, _parameter, _value) {
    if (_object.trainer == -1 || _object.trainer == noone) {
        return;
    }

    var _trainer_name = (!is_undefined(_object.trainer[? "name"])) ? _object.trainer[? "name"] : "Unknown";
    var _pokemon_name = (!is_undefined(_object.pokemon_map[? "title"])) ? _object.pokemon_map[? "title"] : "Unknown Pokemon";

    var _log_text = "[" + date_time_string(date_current_datetime()) + "]: " + 
                    string(_trainer_name) + "'s " + 
                    _pokemon_name + " (" + string(_object.id) + ") " + 
                    " - " + _state_name + " " + _what_do + " " + _parameter + 
                    ", and is now " + string(_value);

    ds_list_add(log_battle, _log_text);
}


/// Logs state expiration
/// @param {Object} _subject - Affected pokemon instance
/// @param {String} _state_name - Name of the expired state
function sc_logging_state_over(_subject, _state_name) {
    if (_subject.trainer == -1 || _subject.trainer == noone) {
        return;
    }

    var _trainer_name = (!is_undefined(_subject.trainer[? "name"])) ? _subject.trainer[? "name"] : "Unknown";
    var _pokemon_name = (!is_undefined(_subject.pokemon_map[? "title"])) ? _subject.pokemon_map[? "title"] : "Unknown Pokemon";

    var _log_text = "[" + date_time_string(date_current_datetime()) + "]: " + 
                    string(_trainer_name) + "'s " + 
                    _pokemon_name + " (" + string(_subject.id) + ") " + 
                    " - " + _state_name + " no longer affects.";

    ds_list_add(log_battle, _log_text);
}


/// Logs experience gain events
/// @param {Object} _object - Pokemon or Action receiving exp
/// @param {Real} _value - Amount of experience gained
/// @param {Enum} _event - Type of event causing exp gain
function sc_logging_experience(_object, _value, _event) {
    if (is_undefined(_value)) {
        _value = 0;
    }

    var _event_desc = "accident";
    var _is_action_exp = false;
    
    switch (_event) {
        case poke_exp.damage:
            _event_desc = "deal damage";
            _is_action_exp = false;
            break;
        case poke_exp.dodge:
            _event_desc = "dodge";
            _is_action_exp = false;
            break;
        case poke_exp.kill:
            _event_desc = "frag";
            _is_action_exp = false;
            break;
        case act_exp.use:
            _event_desc = "training skill";
            _is_action_exp = true;
            break;
        case act_exp.success:
            _event_desc = "successfully applying skill";
            _is_action_exp = true;
            break;
        default:
            // Unknown event type, exit to avoid logging garbage
            return;
    }

    var _log_text = "";
    var _name = "";

    if (!_is_action_exp) {
        _name = (!is_undefined(_object.pokemon_map[? "title"])) ? _object.pokemon_map[? "title"] : "Pokemon";
        _log_text = "!___________________" + _name + " gained exp. +" + string(_value) + "! for event: " + _event_desc + ".";
    } else {
        _name = (!is_undefined(_object[? "name"])) ? _object[? "name"] : "Action";
        _log_text = "!___________________" + _name + " gained exp. +" + string(_value) + "! for event: " + _event_desc + ".";
    }

    ds_list_add(log_battle, _log_text);
}


/// Logs generic info messages
/// @param {String} _text - Message text to log
function sc_logging_info(_text) {
    var _log_text = "[" + date_time_string(date_current_datetime()) + "]: " + string(_text);
    ds_list_add(log_battle, _log_text);
}
