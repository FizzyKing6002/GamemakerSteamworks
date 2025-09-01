hovered = false;
selected = false;
disabled = false;

textColor = c_white;
text = "Host Lobby";

function select_action ()
{
	global.server = instance_create_depth(0, 0, 0, obj_server);
	steam_lobby_create(steam_lobby_type_public, 4);
}