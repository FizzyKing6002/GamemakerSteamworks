lobby_list = [];

image_xscale = 25;
image_yscale = 16;

lobby_list[0] = instance_create_depth(x, bbox_top + 40, -20, obj_lobby_item);

steam_lobby_list_add_string_filter("isGameMakerTest", "true", steam_lobby_list_filter_eq);
steam_lobby_list_request();

alarm[0] = 500;

function resetLobbyList ()
{
	for (var _i = 0; _i < array_length(lobby_list); _i++)
	{
		show_debug_message("Deleting: " + string(lobby_list[_i]));
		instance_destroy(lobby_list[_i]);
	}
	lobby_list = [];
}