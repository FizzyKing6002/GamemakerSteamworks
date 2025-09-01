draw_self();

draw_set_halign(fa_left);
draw_set_valign(fa_middle);

if lobbyID != -1
{
	draw_text_transformed(bbox_left+10, y-5, "LobbyID: " + string(lobbyID), 0.5, 0.5, 0);
	draw_text_transformed(bbox_left+10, y+5, "Creator: " + lobbyCreator, 0.5, 0.5, 0);
}
else
{
	draw_text(bbox_left+10, y, "Searching...");
}