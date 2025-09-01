if hostID == 0 then exit;
if localRequests.ready
{
	handle_self_ready_request();
	localRequests.ready = false;
}