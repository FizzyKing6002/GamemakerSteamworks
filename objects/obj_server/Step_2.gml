if localRequests.gameStart.request
{
	handle_self_game_start_request();
	localRequests.gameStart.request = false;
}