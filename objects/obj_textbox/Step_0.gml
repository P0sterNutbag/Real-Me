var push = max(0,mouse_check_button_pressed(mb_left),keyboard_check_pressed(vk_space),keyboard_check_pressed(ord("E")),keyboard_check_pressed(vk_enter));
var spdup = max(0,mouse_check_button(mb_left),keyboard_check(vk_space),keyboard_check(ord("E")),keyboard_check(vk_enter));

// Finish
if string_length(textOutput) >= string_length(string(text[text_index])) {
	done = true;
	if alarm[1] = -1  alarm[1] = 30;
	if push {
		if text_index < text_amount-2 {
			draw_next = true;
			text_index+=2;
			alarm[0] = 10;
			textOutput = "";
			textPosition = 1;
			currentLine = "";
			currentCharacter = "";
			scr_textbox_set_portait();
		} else {
			cutscene_end_action();
			instance_destroy();
		}
	}
} else {
	done = false;
	if spdup  textSpeed = 1;
}

