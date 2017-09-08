# ACKGUID
Ein [*Globally Unique Identifier*](https://de.wikipedia.org/wiki/Globally_Unique_Identifier), welcher
im Erweiterungssystem für Acknext verwendet wird.

## Definition

```ack
typedef struct
{
	uint8_t id[16];
} ACKGUID;
```

## Elemente
- **`id`**
	Ein Array von 16 Bytes, welches die 128 Bit eines GUID kodiert.

## Siehe auch
- [[guid_create]], [[guid_compare]], [[guid_parse]]
- [[ext_register]]
- [Liste bekannter GUIDs](list-of-known-guids.htm)