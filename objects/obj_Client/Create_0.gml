inbuf = buffer_create(1, buffer_grow, 1);

steamID = steam_get_user_steam_id();
steamName = steam_get_persona_name();

hostID = steam_lobby_get_owner_id();

playerList = [
{
	steamID : steamID,
	steamName : steamName,
	ready : false,
}];
lobbyIndex = 0;

localRequests =
{
	ready : false
}