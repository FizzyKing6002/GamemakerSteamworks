draw_self();

draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_text_transformed(bbox_left+10, y-5, playerName, 0.5, 0.5, 0);
if readyBool then draw_text_transformed(bbox_left+10, y+5, "Ready", 0.5, 0.5, 0);
else draw_text_transformed(bbox_left+10, y+5, "Not Ready", 0.5, 0.5, 0);