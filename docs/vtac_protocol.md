# VTAC Protocol
### **V***ision***T***est***A***dministrative***C***onsole*

VTAC is a JSON-based protocol that allows for remote administration of VisionTest computers.

By default VTAC uses TCP port `5582`.

### VTAC packets

A VTAC packet contains two parts: type, and content.
VTAC packets can have any of the following types:
* `command`: Client is sending a command to the server
* `response`: Server is responding to the client's command
* `id_server`: Server is identifying itself as a VTAC server and providing its name
* `id_client`: Client is identifying itself as a VTAC client
* `error`: Identifies that an error has occured on either party's end
* `disconnect`: Server wants client to disconnect and is providing a reason

An example VTAC packet exchange:

```rb
{"type":"id_server","contents":"matthias-visiontest"} # Server identifying itself
{"type":"id_client","contents":"vtac_client"} # Client identifying itself
{"type":"command","contents":"analytics keypresses view 03"} # Client sends command
{"type":"response","contents":"21"} # Server responds
```
