# GamemakerSteamworks
<br>

## About:
This project is a template I've made for myself to use multiplayer in gamemaker studio through the steamworks extension.
<br><br><br>

## Features:
Packet send and receive system;<br>
Lobby hosting and joining;<br>
Lobby filtering;<br>
Lobby list display;<br>
Ready up system in lobby;<br>
Start system for game.
<br><br><br>

## How to use:
When sending and receiving packets, there is a process that must be maintained else multiplayer code becomes unreadable. An example of this process can be found in the code in the form of the ready system, and I have provided another below.
<br><br>
The player **hosting the server** gets a **server object** made for it, whilst the other lobby members get **client objects** instead. (This means the host player has **no** client object! Its client is the server object.)
<br><br>
When a client wants to **ask** the server to do something, first a **local request** is made to the client from the object that was interacted with (e.g. Arrow key was pressed so you must request your client to move).<br>
Then the client **handles this request** by calling a corresponding function found in the **ClientHandleLocalRequests** script.<br>
Inside this script, the client must always attempt to **approve the local request** with a function call to the **ClientApproval** script - the approval function can just be "return true;" if no approval is needed, but it should still exist.<br>
If approved, the client **sends the request** to the server with its respective function found in the **ClientSendRequests** script.<br>
Inside this function a **buffer** is made for the request and it is **relayed** to the host player - a separate function should be made to create these buffers to ensure clean code.
<br><br>
When the server **receives the request** it immediately calls its **handle request** function found in the **ServerHandleRequests** script, and deals with the server packet there to ensure clean code.<br>
Inside this function the server, like the client, must **approve this request** in the **ServerApproval** script even though the player's client has already approved it, this is for two reasons:<br>
First the server may know more information about the players' privelages so the client may not be able to pass proper judgement;<br>
Second the client could edit its code to approve the request manually so approving it server-side is mandatory to avoid hacks.<br>
After approval, the server should **first send the accept packet** in the **ServerSendAccepts** script, then accommodate the changes that the client requested as this **reduces ping**.<br>
Once again, sending the accept packet involves creating a buffer for the packet and **relaying or bouncing** it to the clients.<br>
Bouncing is sending the packet to **all** clients rather than just the one that requested it, and this will be used most of the time since all clients need to know about any change that has been accepted.
<br><br>
Now once the client **receives the accept**, it must **handle the accept** by calling the respective function in **ClientHandleAccepts** and carry out the changes requested there.
<br><br><br>
This is the **flow of code** for the above process in the example context of a **player attempting to move**:
<br>
```
// CLIENT SIDE
[In obj_player]:
global.client.localRequests.movement.request = true;
global.client.localRequests.movement.x = _x_position;
global.client.localRequests.movement.y = _y_position;

[In obj_client]:
if localRequests.movement.request then handle_self_movement_request(localRequests.movement.x, localRequests.movement.y);

[In handle_self_movement_request (x, y)]:
if approve_self_movement(x, y) then send_movement_request(x, y);

[In send_movement_request (x, y)]:
var _buffer = buffer_create_movement_request(x, y);
buffer_relay_client_to_server(_buffer);
buffer_delete(_buffer);


// SERVER SIDE
[In obj_server]:
case PacketType.MovementRequest: handle_movement_request(senderID, buffer);

[In handle_movement_request (senderID, buffer)]:
// x, y are given by reading the buffer
if approve_movement(senderID, x, y) then { send_movement_accept(senderID, x, y); move_player(senderID, x, y); }

[In send_movement_accept (senderID, x, y)]:
var _buffer = buffer_create_movement_accept(senderID, x, y);
buffer_bounce_server_to_clients(_buffer);
buffer_delete(_buffer);


// CLIENT SIDE
[In obj_client]:
case PacketType.MovementAccept: handle_movement_accept(buffer);

[In handle_movement_accept (buffer)]:
// playerID, x, y are given by reading the buffer
move_player(playerID, x, y);
```
---
This project is under the MIT license and is not accepting contributions.
