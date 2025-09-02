lobbyList = [];

image_xscale = 25;
image_yscale = 16;



lobbyList[0] = instance_create_depth(x, bbox_top + 40, -20, obj_lobby_item);

steam_lobby_list_add_string_filter("isGameMakerTest", "true", steam_lobby_list_filter_eq);
steam_lobby_list_request();

alarm[0] = 500;



function resetLobbyList ()
{
	for (var _i = 0; _i < array_length(lobbyList); _i++)
	{
		instance_destroy(lobbyList[_i]);
	}
	lobbyList = [];
}