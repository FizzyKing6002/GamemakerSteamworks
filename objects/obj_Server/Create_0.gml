inbuf = buffer_create(1, buffer_grow, 1);

steamID = steam_get_user_steam_id();
steamName = steam_get_persona_name();

show_debug_message("Host: " + string(steamID))

playerList = [
{
	steamID : steamID,
	steamName : steamName,
	ready : false,
}];