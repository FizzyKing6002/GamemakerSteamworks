hovered = false;
selected = false;
disabled = false;

textColor = c_white;

lobbyIndex = 0;
lobbyID = -1;
lobbyCreator = "SteamPlayer";

image_xscale = 5;
image_yscale = 0.5;

function select_action ()
{
	global.client = instance_create_depth(0, 0, 0, obj_client);
	steam_lobby_list_join(lobbyIndex);
}