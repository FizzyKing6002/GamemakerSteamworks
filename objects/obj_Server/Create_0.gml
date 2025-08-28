playerList = [];

steamID = steam_get_user_steam_id();
steamName = steam_get_persona_name();

lobbyMemberID = 0
character = undefined;

inbuf = buffer_create(1, buffer_grow, 1);

playerList[0] = {
    steamID : steamID,
    steamName : steamName,
    character : undefined,
    startPos : grab_spawn_point(0),
    lobbyMemberID : 0,
}