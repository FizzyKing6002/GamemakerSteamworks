/// @self obj_client
function handle_player_ready_accept (_b)
{
	_readyID = buffer_read(_b, buffer_u64);
	make_player_ready(_readyID);
}