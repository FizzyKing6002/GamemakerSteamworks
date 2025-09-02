if localHost == undefined then exit;

resetReadyList();

for (var _i = 0; _i < array_length(localHost.playerList); _i++)
{
	var _inst = instance_create_depth(x, bbox_top + 30 + 40*_i, -20, obj_ready_item);
	_inst.readyIndex = _i;
	_inst.readyBool = localHost.playerList[_i].ready;
	if localHost.playerList[_i].steamID == localHost.steamID then _inst.playerName = "You";
	else _inst.playerName = localHost.playerList[_i].steamName;
	
	array_push(readyList, _inst);
}

alarm[0] = 100;