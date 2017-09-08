# `guid_parse`

Parses a [[ACKGUID]] from a simple string representation

## Definition
```ack
ACKGUID guid_parse(char const * text)
```

## Parameters

- **`text`**
  A string representation of a [GUID](ACKGUID.htm)
	
## Returns
The parsed GUID.

## Supported Formats:
The following formats are supported by `guid_parse`.

- `"{xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}"`
- `"xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"`
- `"xxxxxxxx xxxx xxxx xxxx xxxxxxxxxxxx"`
- `"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"`

## Example
```ack
ACKGUID terrainID = guid_parse("{5507c27d-37B7-4623-b363-ed273e7ba962}");
```

## See also
- [[Gui]]
- [[Scene]]