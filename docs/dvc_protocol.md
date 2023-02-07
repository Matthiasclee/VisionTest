# DVC Protocol
**D**irect**V**isionTest**C**ontrol

DVC is a JSON-based protocol that allows for VisionTest machines to be operated remotely.

By default VTAC uses TCP port `5583`.

### DVC packets

A DVC packet contains two parts: type, and content, and is similar to a VTAC packet.

#### Packet types
DVC packets can have any of the following types:
* `javascript`: Client is sending a javascript command to the server
* `action`: Client is telling the server to simulate a keypress on a remote
* `response`: Server is responding to the client's command (action or javascript)
* `id_server`: Server is identifying itself as a DVC server and providing its name
* `id_client`: Client is identifying itself as a DVC client
* `error`: Identifies that an error has occured on either party's end
* `disconnect`: Server wants client to disconnect and is providing a reason
* `password`: Client is authenticating itself with a password *NOTE: this password is sent as cleartext*

#### Packet structure
DVC packets are JSON based, and have a specific structure, equivalent to that of a VTAC packet.
The `"type"` value is the packet type, as defined above, and the `"contents"` value contains the packet contents.

Example packet:
```rb
{
  "type": "action",
  "contents": "A0"
}
```

#### Contents for packet types
* `javascript`: Javascript code to be executed
* `action`: The key ID of a remote button
* `response`: Server's response to the command
* `id_server`: `<server name>~<VisionTest version>` (only contains server name in versions prior to `0.0.2`)
* `id_client`: `dvc_client` (this doesn't change)
* `error`: Error message
* `disconnect`: Reason for disconnect
* `password`: Server's password

### DVC handshake
When a client connects to a DVC server, they must perform a handshake to ensure that both are valid DVC peers.

When a client connects to the server, the server will send an `id_server` packet, which identifies itself as a DVC server, and provides its name and version.
```rb
{"type":"id_server","contents":"matthias-visiontest~v0.0.2"} # Server identifying itself
```

After this, the client must now send an `id_client` packet, validating itself as a DVC client. The `"contents"` field of this packet must always be `"dvc_client"`
```rb
{"type":"id_client","contents":"dvc_client"} # Client identifying itself
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

The password is stored in `conf/dvc_pw` as an SHA256 hash.

### Commands and responses
Once the handshake is completed, the server will wait for a `javascript` or `action` packet. That packet looks like this:
```rb
{"type":"javascript","contents":"up()"} # Client sending `up()` javascript code
```

If the command is valid, the server will send back a `response` packet. When the command is javascript, the response is what the JS returned. it is just blank when the command is an action.
```rb
{"type":"response","contents":"true"} # Server's response
```


An example DVC packet exchange:

```rb
{"type":"id_server","contents":"matthias-visiontest~v0.0.2"} # Server identifying itself
{"type":"id_client","contents":"dvc"} # Client identifying itself
{"type":"command","contents":"return sgl"} # Client sends command
{"type":"response","contents":"false"} # Server responds
```

