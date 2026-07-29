/// @desc Cleanup - Close file and destroy resources

if (!is_undefined(global.log_battle)) {
    ds_list_destroy(global.log_battle);
    global.log_battle = undefined;
}

if (!is_undefined(fname) && fname != -1) {
    file_text_close(fname);
    fname = undefined;
}
