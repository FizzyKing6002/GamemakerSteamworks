inbuf = buffer_create(1, buffer_grow, 1);

steamID = steam_get_user_steam_id();
steamName = steam_get_persona_name();

playerList = [
{
	steamID : steamID,
	steamName : steamName,
	ready : true,
}];