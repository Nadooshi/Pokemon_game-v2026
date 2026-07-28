///@arg instance_or_map
if verbose_debug_mode {
    global.sc_does_exist = function (instance_or_ds, ds_type, info) {
        var printmsg = function(errordesc, info) {
            show_debug_message(
                "     [!] {0} {1} of {2}", errordesc, info ?? "", object_get_name(other.object_index)
            );
        }
        var ds_types;
        ds_types = ds_map_create();
        ds_map_add(ds_types, ds_type_list, "LIST");
        ds_map_add(ds_types, ds_type_map, "MAP");

        if is_undefined(ds_type) {
            ds_type = ds_type_map;
        }

        var _value = instance_or_ds;
        if is_string(_value) {
            printmsg(" NOT AN ID (" + string(_value) + ") ", info);
            return false;
        }
        
        if !is_undefined(_value) {
            if !ds_exists(_value, ds_type) {
                if !instance_exists(_value) {
                    printmsg(" NEITHER INSTANCE NOR DS " + ds_map_find_value(ds_types, ds_type) + " (" + string(_value) + ") ", info);
                    return false;
                }
            }
        } else {
            printmsg(" UNDEFINED ", info);
            return false;
        }
    
        return true;
    }
} else {
    global.sc_does_exist = function (instance_or_ds, ds_type, info) {

        if is_undefined(ds_type) {
            ds_type = ds_type_map;
        }

        var _value = instance_or_ds;
        if is_string(_value) {
            return false;
        }

        if !is_undefined(_value) {
            if !ds_exists(_value, ds_type) {
                if !instance_exists(_value) {
                    return false;
                }
            }
        } else {
            return false;
        }
    
        return true;
    }
}
