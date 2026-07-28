/// @desc Finish input

if async_load[? "id"] = msg
if async_load[? "status"] {
	value_str = async_load[? "result"]
	if string_length(parameter_name) > 0 
	if ds_exists(map, ds_type_map)
		map[? parameter_name] = value_str
	event_perform(ev_other, ev_user0)
	editing = false
	msg = -1
}
