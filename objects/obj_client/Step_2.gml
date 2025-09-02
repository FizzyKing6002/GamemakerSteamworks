if hostID == 0 then exit;
if localRequests.ready.request
{
	handle_self_ready_request();
	localRequests.ready.request = false;
}