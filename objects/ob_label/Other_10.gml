/// @desc

event_inherited()

if string_length(parameter_name) > 0
if ds_exists(map, ds_type_map) {
	value_str = map[? parameter_name]
	
	caption = value_str
}
