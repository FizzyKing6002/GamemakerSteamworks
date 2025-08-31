hovered = false;
selected = false;
disabled = false;

textColor = c_white;

lobby_index = 0;
lobby_id = -1;
lobby_creator = "SteamPlayer";

image_xscale = 5;
image_yscale = 0.5;

function selectAction ()
{
	global.client = instance_create_depth(0, 0, 0, obj_client);
	steam_lobby_list_join(lobby_index);
}