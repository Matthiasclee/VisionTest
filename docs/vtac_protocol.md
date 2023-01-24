# VTAC Protocol
**V**ision**T**est**A**dministrative**C**onsole

VTAC is a JSON-based protocol that allows for remote administration of VisionTest computers.

By default VTAC uses TCP port `5582`.

### VTAC packets

A VTAC packet contains two parts: type, and content.

#### Packet types
VTAC packets can have any of the following types:
* `command`: Client is sending a command to the server
* `response`: Server is responding to the client's command
* `id_server`: Server is identifying itself as a VTAC server and providing its name
* `id_client`: Client is identifying itself as a VTAC client
* `error`: Identifies that an error has occured on either party's end
* `disconnect`: Server wants client to disconnect and is providing a reason

#### Packet structure
VTAC packets are JSON based, and have a specific structure.
The `"type"` value is the packet type, as defined above, and the `"contents"` value contains the packet contents.

Example packet:
```rb
{
  "type": "command",
  "contents": "analytics keypresses view A0"
}
```

#### Contents for packet types
* `command`: Client's command
* `response`: Server's response to the command
* `id_server`: `<server name>~<VisionTest version>` (only contains server name in versions prior to `0.0.2`)
* `id_client`: `vtac_client` (this doesn't change)
* `error`: Error message
* `disconnect`: Reason for disconnect

### VTAC handshake
When a client connects to a VTAC server, they must perform a handshake to ensure that both are valid VTAC peers.

When a client connects to the server, the server will send an `id_server` packet, which identifies itself as a VTAC server, and provides its name and version.
```rb
{"type":"id_server","contents":"matthias-visiontest~v0.0.2"} # Server identifying itself
```

After this, the client must now send an `id_client` packet, validating itself as a VTAC client. The `"contents"` field of this packet must always be `"vtac_client"`
```rb
{"type":"id_client","contents":"vtac_client"} # Client identifying itself
```

Now, the server will wait for a `command` packet from the client.

### Commands and responses
Once the handshake is completed, the server will wait for a `command` packet. That packet looks like this:
```rb
{"type":"command","contents":"analytics keypresses view 03"} # Client sending "analytics keypresses view 03" command
```

If the command is valid, the server will send back a `response` packet.
```rb
{"type":"response","contents":"21"} # Server's response
```


An example VTAC packet exchange:

```rb
{"type":"id_server","contents":"matthias-visiontest~v0.0.2"} # Server identifying itself
{"type":"id_client","contents":"vtac_client"} # Client identifying itself
{"type":"command","contents":"analytics keypresses view 03"} # Client sends command
{"type":"response","contents":"21"} # Server responds
```
