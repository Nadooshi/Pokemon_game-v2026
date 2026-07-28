/// @desc 

event_inherited()

if string_length(parameter_name) > 0 {
	if sc_does_exist(map, undefined, "'map' in User0") {
		image_index = map[? parameter_name]
		hint = attack_type_text[map[? parameter_name]]
		if map[? "repeatable"]
			repeat_act = true
	}
}

