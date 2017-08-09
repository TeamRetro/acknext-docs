# COLOR
Die Darstellung einer Farbe im additiven Farbmischsystem.
Sind alle Werte 0 entspricht das der Farbe Schwarz, sind alle Werte 1 entspricht das der Farbe Weiß.
Zusätzlich kann ein Deckvermögen angegeben werden.

## Definition

```ack
struct
{
	var red, green, blue, alpha;
} COLOR;
```

## Elemente
- **`red, green, blue`**
	Die Rot-, Grün- und Blau-Anteile der Farbe im Bereich von 0 bis 1 oder größer 1 bei überstrahlenden Farben etwa für Shader.
- **`alpha`**
	Das Deckvermögen der Farbe. 0 heißt sie deckt überhaupt nicht, 1 bedeutet vollständige Abdeckung.

## Vordefinierte Farben
- `COLOR_BLACK`
- `COLOR_RED`
- `COLOR_GREEN`
- `COLOR_BLUE`
- `COLOR_YELLOW`
- `COLOR_MAGENTA`
- `COLOR_CYAN`
- `COLOR_WHITE`
- `COLOR_TRANSPARENT`

## Siehe auch
- 

