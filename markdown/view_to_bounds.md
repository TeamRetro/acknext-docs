# `view_to_bounds`

Berechnet die tatsächliche Position und Größe einer [[VIEW]].

## Definition
```ack
void view_to_bounds(VIEW const * view, POINT * pt, SIZE * size)
```

## Parameter
- **`view`** (optional)
  Die [[VIEW]], für welche die Daten berechnet werden sollen. Falls `NULL`, wird der Bildschirm als Referenz verwendet.
- **`pt`** (optional)
  Wenn nicht `NULL`, wird in diesen Pointer die Position des [[VIEW]] geschrieben.
- **`size`** (optional)
  Wenn nicht `NULL`, wird in diesen Pointer die Größe des [[VIEW]] geschrieben.

## Beispiel

```ack
// Berechne das Seitenverhältnis einer View:
var view_to_aspect(VIEW * view)
{
	int i; float f;
	SIZE size;
	view_to_bounds(view, NULL, &size);
	return (var)size.width / (var)size.height;
}
```
	
## Siehe auch
- [[VIEW]]
- [[VECTOR]]