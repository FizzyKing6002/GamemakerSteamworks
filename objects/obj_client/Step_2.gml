if localRequests.ready
{
	handle_self_ready_request();
	localRequests.ready = false;
}