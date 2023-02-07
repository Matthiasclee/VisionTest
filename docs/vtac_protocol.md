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
* `password`: Client is authenticating itself with a password *NOTE: this password is sent as cleartext*

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
* `password`: Server's password

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

### Authentication
VTAC servers can be configured to require a password for clients to be able to connect.
If the server does not require a password, the handshake will be normal, as seen above.
If the server does require a password, however, `~authreq` will be appended to the `id_server` packet, indicating that a password is required.
```rb
{"type":"id_server","contents":"matthias-visiontest~v0.0.3~authreq"} # Server identifying itself and requiring authentication
```

In this case, after the handshake is completed as seen above, the server will wait for a `password` packet to be sent by the client before allowing commands to be run.
```rb
{"type":"password","contents":"super-secure-password"} # Client sending a password
```

If the password is correct, the server will send a `response` packet containing `"AUTH_SUCCESS"`, and allow commands to be sent. If not, the server will send an `error` packet containing `"BAD_PASSWORD"`.

The password is stored in `conf/vtac_pw` as an SHA256 hash.

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
