/// @desc

// Inherit the parent event
event_inherited();

if string_length(parameter_name) > 0 {
	if sc_does_exist(map) {
		image_index = map[? parameter_name]
	}
}
